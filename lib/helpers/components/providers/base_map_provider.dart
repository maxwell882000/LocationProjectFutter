// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:location_specialist/helpers/models/base/base_provider.dart';
import 'package:location_specialist/helpers/widgets/snackbars/snackbar_handler.dart';

class BaseMapProvider extends BaseProvider {
  Map<int, Marker> markers = <int, Marker>{};

  late CameraPosition cameraPosition = new CameraPosition(
    target: LatLng(55.7558, 37.6173),
    zoom: 10,
  );

  Future<LocationData> _locationPosition() async{
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        SnackbarHandler.error(title: "Ошибка", body: "Пожалуйста включите геолакацию");
        throw "";
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        SnackbarHandler.error(
            title: "Ошибка", body: "Пожалуйста включите геолакацию");
        throw "";
      }
    }
    return await location.getLocation();
  }
  // Future<Position> _determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   print("Checking goes on");
  //   if (!serviceEnabled) {
  //     SnackbarHandler.error(
  //         title: "Ошибка", body: "Пожалуйста включите геолакацию");
  //     throw "";
  //   }
  //
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       SnackbarHandler.error(
  //           title: "Ошибка", body: "Пожалуйста включите геолакацию");
  //       throw "";
  //     }
  //   }
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     SnackbarHandler.error(
  //         title: "Ошибка", body: "Пожалуйста включите геолакацию");
  //     throw "";
  //   }
  //   return await Geolocator.getCurrentPosition();
  // }

  @override
  initAsync() async {
    try {
      var position = await _locationPosition();
      cameraPosition = CameraPosition(
          target: LatLng(position.latitude ?? 0, position.longitude ?? 0), zoom: 10.0);
    } catch (e) {}
  }
}
