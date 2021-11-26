import 'package:get/get.dart';
import 'package:location_specialist/helpers/models/base/base_provider.dart';
import 'package:location_specialist/helpers/models/category/category.dart';
import 'package:location_specialist/helpers/models/location/location.dart';
import 'package:location_specialist/helpers/models/location/location_paginate.dart';
import 'package:location_specialist/repository/location/location_repository.dart';

class CategoryViewProvider extends BaseProvider {
  late Category _category;
  late LocationPaginate _location = new LocationPaginate();
  Category get category => _category;

  set category(Category category) {
    _category = category;
    notifyListeners();
  }

  CategoryViewProvider() {
    this.category = Get.arguments as Category;
  }
  void setLocationCategory(List<Location> locations) {
    this._category.setLocation(locations);
    notifyListeners();
  }

  Future nextLocation() async {
    this._location =
        await LocationRepository().locationListCategory(this._category.id);
    setLocationCategory([...this._category.location, ...this._location.list]);
  }

  @override
  Future initAsync() async {

    this._location =
        await LocationRepository().locationListCategory(category.id);
    setLocationCategory(this._location.list);
  }
}
