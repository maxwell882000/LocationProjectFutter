import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_specialist/helpers/widgets/future_widget/future_provider_custom.dart';
import 'package:location_specialist/pages/main/providers/map_provider.dart';
import 'package:provider/provider.dart';

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
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: FutureProviderCustom<MapProvider>(
                create: new MapProvider(),
                child: Consumer<MapProvider>(
                    builder: (context, provider, child) => GoogleMap(
                        mapToolbarEnabled: false,
                        zoomControlsEnabled: false,
                        markers: Set<Marker>.of(provider.markers.values),
                        initialCameraPosition: provider.cameraPosition)))));
  }
}
