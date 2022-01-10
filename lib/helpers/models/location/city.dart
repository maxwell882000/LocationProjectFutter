import 'package:location_specialist/helpers/models/base/base_model.dart';

class City extends BaseModel {
  late final String city;
  City.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    city = map['city'];
  }
}
