import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/pages/location/provider/city_search_provider.dart';

import '../../../helpers/widgets/map/widget/base_search_map_widget.dart';

class CitySearch extends BaseSearchMapWidget<CitySearchProvider> {
  CitySearch() : super(create: createProvider);

  static CitySearchProvider createProvider(context) {
    return new CitySearchProvider();
  }

  @override
  onTapSearch(e) {
    Get.back(result: e);
  }
}
