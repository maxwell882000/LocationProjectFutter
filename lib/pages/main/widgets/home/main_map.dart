import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_specialist/helpers/widgets/future_widget/future_provider_custom.dart';
import 'package:location_specialist/pages/main/providers/map_provider.dart';
import 'package:provider/provider.dart';

class MainMap extends StatelessWidget {
  const MainMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureProviderCustom<MapProvider>(
        create: new MapProvider(),
        child: Consumer<MapProvider>(
            builder: (context, provider, child) => GoogleMap(
                onCameraMove: (CameraPosition camera) {
                  provider.addLocations(camera);
                },
                mapToolbarEnabled: false,
                zoomControlsEnabled: false,
                markers: Set<Marker>.of(provider.markers.values),
                initialCameraPosition: provider.cameraPosition)));
  }
}
