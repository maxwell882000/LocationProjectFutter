import 'package:location_specialist/helpers/models/specialist/specialist.dart';
import 'package:location_specialist/helpers/models/specialist/specialist_paginate.dart';
import 'package:location_specialist/repository/mixin/api_base_methods.dart';
import 'package:location_specialist/repository/model/request.dart';

class SpecialistRepository with ApiBaseMethods {
  static final SpecialistRepository _singleton =
      SpecialistRepository._internal();
  factory SpecialistRepository() {
    return _singleton;
  }
  SpecialistRepository._internal();

  static const String prefix = "specialist/";

  Future<SpecialistPaginate> specialistList({String query = ""}) async {
    Map<String, dynamic> response =
        await this.get(new Request(prefix + "list/?" + query));
    return SpecialistPaginate.fromJson(response);
  }

  Future<SpecialistPaginate> specialistListPaginate(String url) async {
    Map<String, dynamic> response = await this.getPaginate(new Request(url));
    return SpecialistPaginate.fromJson(response);
  }

  Future<Specialist> specialistCreate(Map<String, dynamic> map) async {
    var request = await this.post(Request(prefix + "create/", data: map));
    return Specialist.fromJson(request);
  }

  Future<Specialist> specialistUpdate(
      int specialistId, Map<String, dynamic> map) async {
    print(map);
    var request =
        await this.put(Request(prefix + "update/$specialistId/", data: map));
    return Specialist.fromJson(request);
  }

  Future<SpecialistPaginate> specialistListLocation(int id) {
    return this.specialistList(query: "location=${id.toString()}");
  }
}
