import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:location_specialist/helpers/models/error/error.dart';
import 'package:location_specialist/helpers/models/error/middleware.dart';
import 'package:location_specialist/providers/auth_provider.dart';
import 'package:location_specialist/repository/model/request.dart';
import 'package:location_specialist/repository/model/request_file.dart';
import 'package:location_specialist/repository/model/request_files.dart';
import 'package:location_specialist/repository/model/status.dart';
import 'package:location_specialist/routes/path.dart';

mixin ApiBaseMethods {
  Map<String, String> get headers => {
        'Authorization': AuthProvider.getToken(),
        'Content-Type': 'application/json'
      };

  Future<http.StreamedResponse> multipartManyPost(
      RequestFiles requestData) async {
    var request = http.MultipartRequest('POST', requestData.url)
      ..fields.addAll(requestData.fileData)
      ..headers.addAll(this.headers);
    for (Future<http.MultipartFile> item in requestData.files) {
      request.files.add(await item);
    }
    http.StreamedResponse response = await request.send();
    return response;
  }

  Future<http.StreamedResponse> multipartPost(RequestFile requestData) async {
    try {
      var request = http.MultipartRequest('POST', requestData.url)
        ..fields.addAll(requestData.fileData)
        ..files.add(await requestData.file)
        ..headers.addAll(this.headers);
      http.StreamedResponse response = await request.send();
      return response;
    } on SocketException catch (e) {
      Get.offAllNamed(Path.NOT_INTERNET);
      throw e;
    }
  }

  Future<dynamic> post(Request requestData) async {
    try {
      var request = await http.post(requestData.url,
          body: jsonEncode(requestData.data), headers: this.headers);
      return this._responseFromClient(request,
          requestData: requestData.data, path: requestData.url.path);
    } on SocketException catch (e) {
      Get.offAllNamed(Path.NOT_INTERNET);
      // throw e;
    }
  }

  dynamic _responseFromClient(http.Response request,
      {Map requestData = const {}, String path = ""}) {
    dynamic response = {};
    if (request.body.isNotEmpty) {
      try {
        response = jsonDecode(request.body);
      } catch (e) {
        print("DATA ${jsonEncode(requestData)}");
        print(request.body);
      }
    }
    if (request.statusCode == Status.HTTP_ERROR) {
      print(response);
      print(request.statusCode);
      print(path);
      throw ErrorCustom(errors: response['errors']);
    } else if (request.statusCode == Status.HTTP_ERROR_401) {
      print(response);
      print(request.statusCode);
      Middleware(request.statusCode.toString()).run();
      throw "";
    } else if (request.statusCode == Status.HTTP_ERROR_403) {
      Middleware(response['detail']).run();
      throw "";
    } else if (request.statusCode != Status.HTTP_200 &&
        request.statusCode != Status.HTTP_201 &&
        request.statusCode != Status.HTTP_204) {
      print(response);
      print(path);

      print(request.statusCode);
      throw ErrorCustom(errors: response);
    }
    return response;
  }

  Future<dynamic> get(Request requestData) async {
    try {
      var request = await http.get(requestData.url, headers: this.headers);
      return this._responseFromClient(request, path: requestData.url.path);
    } on SocketException catch (e) {
      Get.offAllNamed(Path.NOT_INTERNET);
    }
  }

  Future<dynamic> getPaginate(Request requestData) async {
    try {
      var request = await http.get(requestData.emptyUrl, headers: this.headers);
      return this._responseFromClient(request);
    } on SocketException catch (e) {
      Get.offAllNamed(Path.NOT_INTERNET);
    }
  }

  Future<dynamic> put(Request requestData) async {
    try {
      var request = await http.put(requestData.url,
          body: jsonEncode(requestData.data), headers: this.headers);
      return this._responseFromClient(request, requestData: requestData.data);
    } on SocketException catch (e) {
      Get.offAllNamed(Path.NOT_INTERNET);
    }
  }

  Future<dynamic> delete(Request requestData) async {
    var request = await http.delete(requestData.url, headers: this.headers);
    return this._responseFromClient(request);
  }

  Future<Uint8List> getFile(Request requestData) async {
    var request = await http.get(requestData.url);
    return request.bodyBytes;
  }
}
