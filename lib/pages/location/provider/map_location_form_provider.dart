import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_specialist/helpers/components/providers/base_map_provider.dart';
import 'package:location_specialist/helpers/models/location/location.dart';

class MapLocationFormProvider extends BaseMapProvider {
  final Function(LatLng) onSelect;
  late GoogleMapController _controller;
  MapLocationFormProvider(this.onSelect);
  onTapMap(LatLng lat) {
    markers.addAll({
      1: Marker(
        markerId: MarkerId("1"),
        position: lat,
      )
    });
    onSelect(lat);
    _controller.animateCamera(CameraUpdate.newLatLngZoom(lat, 14));
    notifyListeners();
  }

  mapCreated(GoogleMapController controller) {
    this._controller = controller;
  }

  onSelectGeocode(Location location) {
    final LatLng latLng = LatLng(location.latitude, location.longitude);
    cameraPosition = CameraPosition(target: latLng, zoom: 10);
    onTapMap(latLng);
  }
}
