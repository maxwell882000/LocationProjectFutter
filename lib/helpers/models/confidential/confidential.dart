import 'package:flutter/rendering.dart';
import 'package:location_specialist/helpers/models/base/base_model.dart';

class Confidential extends BaseModel {
  late String header;
  late String body;
  Confidential.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    header = map['header'];
    body = map['body'];
  }
}
