import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:location_specialist/helpers/models/icon/icon_menu.dart';
import 'package:location_specialist/helpers/models/logo/logo.dart';
import 'package:location_specialist/helpers/models/media/media.dart';
import 'package:location_specialist/repository/mixin/api_base_methods.dart';
import 'package:location_specialist/repository/model/request.dart';
import 'package:location_specialist/repository/model/request_file.dart';

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

  Future<int> createImageTemp(Media media) async {
    var response = await this.multipartPost(RequestFile(
      "common/temp_store/",
      bytes: media,
    ));
    var re = await response.stream.bytesToString();
    print(re);
    Map<String, dynamic> map = jsonDecode(re);
    return map['id'];
  }

  Future<bool> deleteImageTemp(int id) async {
    var response = await this
        .delete(Request("common/temp_store/delete/${id.toString()}/"));
    return true;
  }
}
