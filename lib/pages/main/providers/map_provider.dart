import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_specialist/helpers/models/base/base_provider.dart';
import 'package:location_specialist/helpers/models/location/location.dart';
import 'package:location_specialist/repository/location/location_repository.dart';
import 'package:location_specialist/routes/path.dart';

class MapProvider extends BaseProvider {
  Map<int, Marker> markers = <int, Marker>{};
  late List<Location> location = [];
  late CameraPosition cameraPosition = new CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 20,
  );

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
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

  Future getLocations(Position position) async {
    var paginate = await LocationRepository().locationListMap(
        latitude: position.latitude, longitude: position.longitude, radius: 5);
    location = paginate.list;
    this.createMarkers();
    notifyListeners();
  }

  @override
  initAsync() async {
    Position position = await _determinePosition();
    cameraPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 10.0);
    getLocations(position);
  }
}
