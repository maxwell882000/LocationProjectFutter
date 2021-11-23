import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainMap extends StatelessWidget {
  const MainMap({Key? key}) : super(key: key);
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Get.height * 0.5,
        child: GoogleMap(initialCameraPosition: _kGooglePlex));
  }
}
