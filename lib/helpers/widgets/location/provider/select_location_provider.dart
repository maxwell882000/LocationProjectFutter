import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/location/location.dart';

class SelectLocationProvider with ChangeNotifier {
  List<Location> _location = [];

  List<Location> get location => _location;

  set location(List<Location> location) {
    _location = location;
    notifyListeners();
  }

  SelectLocationProvider() {
    this.location = Get.arguments as List<Location>;
  }

  addToLocation(Location location) {
    if (_location.where((element) => element.id == location.id).isEmpty) {
      this._location.add(location);
      notifyListeners();
    }
  }

  removeLocation(int index) {
    this._location.removeAt(index);
    notifyListeners();
  }

  back() {
    Get.back(result: this._location);
  }
}
