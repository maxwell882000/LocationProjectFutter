import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_specialist/helpers/models/location/location.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/helpers/widgets/future_widget/future_provider_custom.dart';
import 'package:location_specialist/pages/location/provider/map_location_form_provider.dart';
import 'package:location_specialist/routes/path.dart';
import 'package:provider/provider.dart';

class MapLocationForm extends StatelessWidget {
  final Function(LatLng) onSelect;
  const MapLocationForm({Key? key, required this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureProviderCustom<MapLocationFormProvider>(
      create: MapLocationFormProvider(onSelect),
      child: Column(
        children: [
          Builder(builder: (context) {
            return BlackButton(
              text: "Поиск Локации",
              onPressed: () async {
                var result = await Get.toNamed(Path.GEOCODING);
                if (result is Location) {
                  Provider.of<MapLocationFormProvider>(context, listen: false)
                      .onTapMap(LatLng(result.latitude, result.longitude));
                }
              },
            );
          }),
          StyleHandler.y_margin,
          SizedBox(
            height: 300,
            child: Consumer<MapLocationFormProvider>(
                builder: (context, provider, child) {
              return GoogleMap(
                onMapCreated: provider.mapCreated,
                mapToolbarEnabled: false,
                zoomControlsEnabled: false,
                gestureRecognizers: {
                  Factory<OneSequenceGestureRecognizer>(
                    // super cool
                    () => EagerGestureRecognizer(),
                  ),
                },
                initialCameraPosition: provider.cameraPosition,
                markers: Set<Marker>.of(provider.markers.values),
                onTap: provider.onTapMap,
              );
            }),
          ),
        ],
      ),
    );
  }
}
