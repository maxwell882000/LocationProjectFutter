import 'package:get/get.dart';
import 'package:location_specialist/helpers/widgets/map/provider/base_search_provider.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location_specialist/helpers/widgets/map/widget/base_search_map_widget.dart';
import 'package:location_specialist/pages/location/provider/geocoding_provider.dart';

class Geocoding extends BaseSearchMapWidget<GeocodingProvider> {
  Geocoding() : super(create: getGeocodingProvider);

  static GeocodingProvider getGeocodingProvider(context) {
    return new GeocodingProvider();
  }

  @override
  onTapSearch(e) {
    Get.back(result: e);
  }
}
