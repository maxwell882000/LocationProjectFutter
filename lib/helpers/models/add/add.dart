import 'package:location_specialist/helpers/models/base/base_model.dart';

class Add extends BaseModel {
  late final String image;
  late final String link;
  Add.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    this.image = map['image'];
    this.link = map['link'];
  }
}
