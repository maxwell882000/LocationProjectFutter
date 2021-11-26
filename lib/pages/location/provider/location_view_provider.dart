import 'package:get/get.dart';
import 'package:location_specialist/helpers/models/base/base_provider.dart';
import 'package:location_specialist/helpers/models/location/location.dart';
import 'package:location_specialist/helpers/models/specialist/specialist.dart';
import 'package:location_specialist/helpers/models/specialist/specialist_paginate.dart';
import 'package:location_specialist/repository/location/location_repository.dart';
import 'package:location_specialist/repository/specialist/specialist_repository.dart';

class LocationProviderView extends BaseProvider {
  late Location _location;
  late SpecialistPaginate specialistPaginate;

  Location get location => _location;

  set location(Location location) {
    _location = location;
    notifyListeners();
  }

  LocationProviderView() {
    this._location = Get.arguments as Location;
  }
  void setSpecialistLocation(List<Specialist> specialist) {
    this._location.setSpecialist(specialist);

    print(this._location.specialist);
    notifyListeners();
  }

  Future<List<Specialist>> specialist() async{
        this.specialistPaginate =
        await SpecialistRepository().specialistListLocation(this._location.id);
        return this.specialistPaginate.list;
  }
  @override
  Future initAsync() async {
    this.specialistPaginate =
        await SpecialistRepository().specialistListLocation(this._location.id);
    this.setSpecialistLocation(this.specialistPaginate.list);
  }
}
