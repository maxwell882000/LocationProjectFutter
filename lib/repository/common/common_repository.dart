import 'dart:io';
import 'dart:typed_data';

import 'package:location_specialist/helpers/models/icon/icon_menu.dart';
import 'package:location_specialist/helpers/models/logo/logo.dart';
import 'package:location_specialist/repository/mixin/api_base_methods.dart';
import 'package:location_specialist/repository/model/request.dart';

class CommonRepository with ApiBaseMethods {
  static final CommonRepository _singleton = CommonRepository._internal();

  factory CommonRepository() {
    return _singleton;
  }
  CommonRepository._internal();

  static const String prefix = "common/app/";

  Future<Map<String, dynamic>> getCommon() async {
    final response = await this.get(Request(prefix));
    Map<String, dynamic> newResponse = {};
    newResponse['logo'] = Logo.fromJson(response['logo']);
    newResponse['icon'] =
        response['icon'].map((e) => IconMenu.fromJson(e)).toList();
    return newResponse;
  }

  Future<Uint8List> getCommonFile(String path) async {
    final Uint8List request = await this.getFile(Request(path));
    return request;
  }
}
