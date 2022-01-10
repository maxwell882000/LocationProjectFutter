import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_specialist/helpers/components/providers/base_map_provider.dart';

class MapLocationFormProvider extends BaseMapProvider {
  final Function(LatLng) onSelect;
  MapLocationFormProvider(this.onSelect);
  onTapMap(LatLng lat) {
    markers.addAll({
      1: Marker(
        markerId: MarkerId("1"),
        position: lat,
      )
    });
    onSelect(lat);
    notifyListeners();
  }
}
