import 'package:location_specialist/helpers/models/location/location_paginate.dart';
import 'package:location_specialist/repository/mixin/api_base_methods.dart';
import 'package:location_specialist/repository/model/request.dart';

class LocationRepository with ApiBaseMethods {
  static final LocationRepository _singleton = LocationRepository._internal();
  factory LocationRepository() {
    return _singleton;
  }
  LocationRepository._internal();

  static const String prefix = "location/";
  Future<LocationPaginate> locationList({String query = ""}) async {
    Map<String, dynamic> response =
        await this.get(new Request(prefix + "list/?" + query));
    return LocationPaginate.fromJson(response);
  }

  Future<LocationPaginate> locationListCategory(int id) async {
    return this.locationList(query: "category=" + id.toString());
  }

  Future<LocationPaginate> locationListSearch(String search) async {
    return this.locationList(query: 'search=' + search);
  }

  Future<LocationPaginate> locationListMap(
      {required int radius,
      required double longitude,
      required double latitude}) {
    return this.locationList(
        query: 'size=0&latitude=' +
            latitude.toString() +
            "&longitude=" +
            longitude.toString() +
            "&radius=" +
            radius.toString());
  }
}
