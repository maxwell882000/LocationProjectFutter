
import 'package:location_specialist/helpers/models/location/location.dart';
import 'package:location_specialist/helpers/widgets/map/provider/base_search_provider.dart';
import 'package:location_specialist/repository/location/location_repository.dart';

class SearchProvider extends BaseSearchProvider {

  void listnerText() async {
    if (controller.text.isNotEmpty)
      this.location =
          (await LocationRepository().locationListSearch(controller.text)).list;
  }

}
