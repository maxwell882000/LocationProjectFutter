import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:location_specialist/helpers/models/error/error.dart';
import 'package:location_specialist/helpers/models/error/middleware.dart';
import 'package:location_specialist/providers/auth_provider.dart';
import 'package:location_specialist/repository/model/request.dart';
import 'package:location_specialist/repository/model/request_file.dart';
import 'package:location_specialist/repository/model/request_files.dart';
import 'package:location_specialist/repository/model/status.dart';

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
    var request = http.MultipartRequest('POST', requestData.url)
      ..fields.addAll(requestData.fileData)
      ..files.add(await requestData.file)
      ..headers.addAll(this.headers);
    http.StreamedResponse response = await request.send();
    return response;
  }

  Future<dynamic> post(Request requestData) async {
    var request = await http.post(requestData.url,
        body: jsonEncode(requestData.data), headers: this.headers);
    return this._responseFromClient(request, requestData: requestData.data);
  }

  dynamic _responseFromClient(http.Response request,
      {Map requestData = const {}}) {
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
      throw ErrorCustom(errors: response['errors']);
    } else if (request.statusCode == Status.HTTP_ERROR_403) {
      Middleware(response['detail']).run();
      throw "";
    } else if (request.statusCode != Status.HTTP_200 &&
        request.statusCode != Status.HTTP_201 &&
        request.statusCode != Status.HTTP_204) {
      throw ErrorCustom(errors: response);
    }
    return response;
  }

  Future<dynamic> get(Request requestData) async {
    var request = await http.get(requestData.url, headers: this.headers);
    return this._responseFromClient(request);
  }

  Future<dynamic> getPaginate(Request requestData) async {
    var request = await http.get(requestData.emptyUrl, headers: this.headers);
    return this._responseFromClient(request);
  }

  Future<dynamic> put(Request requestData) async {
    var request = await http.put(requestData.url,
        body: jsonEncode(requestData.data), headers: this.headers);
    return this._responseFromClient(request, requestData: requestData.data);
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
