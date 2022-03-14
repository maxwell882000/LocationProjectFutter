import 'package:location_specialist/helpers/widgets/map/provider/base_search_provider.dart';
import 'package:location_specialist/repository/location/location_repository.dart';

class CitySearchProvider extends BaseSearchProvider {
  @override
  Future listnerText() async {
    if (controller.text.isNotEmpty) {
      this.location =
          await LocationRepository().cityListSearch(controller.text);
    }
  }
  @override
  String hintText() {
    return "Введите город/страну";
  }
}
