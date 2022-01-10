import 'package:flutter/cupertino.dart';
import 'package:location_specialist/helpers/models/base/base_provider.dart';
import 'package:location_specialist/helpers/models/location/city.dart';
import 'package:location_specialist/repository/location/location_repository.dart';

class CityProvider with ChangeNotifier {
  List<City> _cities = [];

  List<City> get cities => _cities;
  Map<int, String> getCityMap() {
    Map<int, String> map = {};
    this.cities.forEach((element) {
      map[element.id] = element.city;
    });
    return map;
  }

  set cities(List<City> cities) {
    _cities = cities;
    notifyListeners();
  }

  onSelectCountry(int countryId) async {
    this.cities = [];
    this.cities = await LocationRepository().cityList(countryId.toString());
  }
}
