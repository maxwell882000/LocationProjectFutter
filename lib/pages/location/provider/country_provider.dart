import 'package:location_specialist/helpers/models/base/base_provider.dart';
import 'package:location_specialist/helpers/models/location/country.dart';
import 'package:location_specialist/repository/location/location_repository.dart';

class CountryProvider extends BaseProvider {
  List<Country> _country = [];

  List<Country> get country => _country;
  Map<int, String> getCountryMap() {
    Map<int, String> map = {};
    _country.forEach((element) {
      map[element.id] = element.country;
    });
    return map;
  }

  CountryProvider() {
    this.initAsync();
    print("UPLOADING HAPPENED");
  }

  set country(List<Country> country) {
    _country = country;
    notifyListeners();
  }

  @override
  initAsync() async {
    this.country = await LocationRepository().countryList();
  }
}
