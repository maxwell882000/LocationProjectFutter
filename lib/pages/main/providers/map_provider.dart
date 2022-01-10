import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_specialist/helpers/components/providers/base_map_provider.dart';
import 'package:location_specialist/helpers/models/location/location.dart';
import 'package:location_specialist/repository/location/location_repository.dart';
import 'package:location_specialist/routes/path.dart';

class MapProvider extends BaseMapProvider {
  late List<Location> _location = [];

  List<Location> get location => _location;

  set location(List<Location> location) {
    _location.addAll(location);
    this.createMarkers();
    notifyListeners();
  }

  void createMarkers() {
    location.forEach((element) {
      markers.addAll({
        element.id: Marker(
            markerId: MarkerId(element.id.toString()),
            position: LatLng(element.latitude, element.longitude),
            onTap: () {
              Get.toNamed(Path.LOCATION_PROFILE, arguments: element);
            })
      });
    });
  }

  int _calculateZoom(int zoom) {
    const TILE_SIZE = 350;
    const CIRCUMFERENCE = 40075016;
    final scale = 1 << zoom;
    return CIRCUMFERENCE ~/ (TILE_SIZE * scale);
  }

  Future addLocations(CameraPosition position) async {
    var paginate = await LocationRepository().locationListMap(
        radius: this._calculateZoom(position.zoom.toInt()),
        longitude: position.target.longitude,
        latitude: position.target.latitude,
        locations:
            this.location.map((e) => 'locations=${e.id}').toList().join('&'));
    this.location = paginate.list;
  }

  Future getLocations(LatLng position) async {
    var paginate = await LocationRepository().locationListMap(
        latitude: position.latitude, longitude: position.longitude, radius: 5);
    this.location = paginate.list;
  }

  @override
  initAsync() async {
    await super.initAsync();
    getLocations(cameraPosition.target);
  }
}
