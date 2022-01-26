import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_specialist/helpers/models/base/base_provider.dart';
import 'package:location_specialist/helpers/widgets/snackbars/snackbar_handler.dart';

class BaseMapProvider extends BaseProvider {
  Map<int, Marker> markers = <int, Marker>{};

  late CameraPosition cameraPosition = new CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 20,
  );

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      SnackbarHandler.error(
          title: "Ошибка", body: "Пожалуйста включите геолакацию");
      throw "";
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        SnackbarHandler.error(
            title: "Ошибка", body: "Пожалуйста включите геолакацию");
        throw "";
      }
    }

    if (permission == LocationPermission.deniedForever) {
      SnackbarHandler.error(
          title: "Ошибка", body: "Пожалуйста включите геолакацию");
      throw "";
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  initAsync() async {
    try {
      Position position = await _determinePosition();
      cameraPosition = CameraPosition(
          target: LatLng(position.latitude, position.longitude), zoom: 10.0);
    } catch (e) {}
  }
}
