import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_specialist/helpers/widgets/future_widget/future_provider_custom.dart';
import 'package:location_specialist/pages/location/provider/map_location_form_provider.dart';
import 'package:provider/provider.dart';

class MapLocationForm extends StatelessWidget {
  final Function(LatLng) onSelect;
  const MapLocationForm({Key? key, required this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureProviderCustom<MapLocationFormProvider>(
      create: MapLocationFormProvider(onSelect),
      child: SizedBox(
        height: 300,
        child: Consumer<MapLocationFormProvider>(
            builder: (context, provider, child) {
          return GoogleMap(
            mapToolbarEnabled: false,
            zoomControlsEnabled: false,
            gestureRecognizers: {
              Factory<OneSequenceGestureRecognizer>( // super cool
                () => EagerGestureRecognizer(),
              ),
            },
            initialCameraPosition: provider.cameraPosition,
            markers: Set<Marker>.of(provider.markers.values),
            onTap: provider.onTapMap,
          );
        }),
      ),
    );
  }
}
