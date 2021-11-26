import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:location_specialist/helpers/models/error/error.dart';
import 'package:location_specialist/repository/model/request.dart';
import 'package:location_specialist/repository/model/requestFile.dart';
import 'package:location_specialist/repository/model/status.dart';

mixin ApiBaseMethods {
  Map<String, String> headers = {};

  Future<http.StreamedResponse> multipartPost(RequestFile requestData) async {
    var request = http.MultipartRequest('POST', requestData.url)
      ..fields.addAll(requestData.data)
      ..files.addAll(requestData.files)
      ..headers.addAll(this.headers);
    http.StreamedResponse response = await request.send();
    return response;
  }

  Future<dynamic> post(Request requestData) async {
    var request = await http.post(requestData.url,
        body: requestData.data, headers: this.headers);
    return this._responseFromClient(request);
  }

  dynamic _responseFromClient(http.Response request) {
    var response = jsonDecode(request.body);
    if (request.statusCode == Status.HTTP_ERROR) {
      throw ErrorCustom(errors: response['errors']);
    } else if (request.statusCode != Status.HTTP_200 &&
        request.statusCode != Status.HTTP_201) {
      throw ErrorCustom();
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
        body: requestData.data, headers: this.headers);
    return this._responseFromClient(request);
  }

  Future<dynamic> delete(Request requestData) async {
    var request = await http.delete(requestData.url, headers: this.headers);
    return this._responseFromClient(request);
  }
}
