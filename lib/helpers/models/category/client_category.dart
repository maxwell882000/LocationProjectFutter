import 'package:location_specialist/helpers/models/base/base_model.dart';

class ClientCategory extends BaseModel {
  late final String name;

  ClientCategory.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    this.name = map['name'];
  }
}
