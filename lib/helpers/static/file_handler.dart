import 'package:flutter/services.dart';
import 'dart:convert' as convert;
class FileHandler {
  static Future<dynamic> getJsonFile(String path) async {
    return rootBundle.loadString(path).then(convert.jsonDecode);
  }
}
