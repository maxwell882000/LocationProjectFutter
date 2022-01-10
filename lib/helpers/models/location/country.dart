import 'package:location_specialist/helpers/models/base/base_model.dart';

class Country extends BaseModel {
  late final String country;
  Country.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    country = map['country'];
  }
}
