import 'dart:convert';

import 'package:location_specialist/helpers/models/image/image.dart';
import 'package:location_specialist/helpers/models/location/city.dart';
import 'package:location_specialist/helpers/models/location/country.dart';
import 'package:location_specialist/helpers/models/location/location.dart';
import 'package:location_specialist/helpers/models/location/location_paginate.dart';
import 'package:location_specialist/helpers/models/media/media.dart';
import 'package:location_specialist/repository/mixin/api_base_methods.dart';
import 'package:location_specialist/repository/model/request.dart';
import 'package:location_specialist/repository/model/request_file.dart';
import 'package:location_specialist/repository/model/request_files.dart';

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

  Future<bool> createLocation(Map<String, dynamic> location) async {
    var response = await this.post(Request(prefix + "create/", data: location));
    return true;
  }

  Future<LocationPaginate> locationListSearch(String search) async {
    return this.locationList(query: 'search=' + search);
  }

  Future<List<City>> cityList(String countryId) async {
    var response =
        await this.get(Request(prefix + "city/list?country_id=" + countryId));
    return response.map<City>((e) => City.fromJson(e)).toList();
  }

  Future<List<Location>> cityListSearch(String city) async {
    var response =
        await this.get(Request(prefix + "city/list/search?city=" + city));
    return response.map<Location>((e) => Location.search(e)).toList();
  }

  Future<List<Country>> countryList() async {
    var response = await this.get(Request(prefix + "country/list"));
    return response.map<Country>((e) => Country.fromJson(e)).toList();
  }

  Future<LocationPaginate> locationListMap({
    required int radius,
    required double longitude,
    required double latitude,
    String locations = "",
  }) {
    return this.locationList(
        query: 'size=0&latitude=' +
            latitude.toString() +
            "&longitude=" +
            longitude.toString() +
            "&radius=" +
            radius.toString() +
            "&" +
            locations);
  }

  Future<Image> uploadImage(Media media) async {
    var response = await this
        .multipartPost(RequestFile(prefix + "image/upload", bytes: media));
    Map<String, dynamic> map =
        jsonDecode(await response.stream.bytesToString());
    return Image.fromJson(map);
  }

  Future<bool> deleteImage(int id) async {
    await this.delete(Request(prefix + "image/delete/${id.toString()}"));
    return true;
  }
}
