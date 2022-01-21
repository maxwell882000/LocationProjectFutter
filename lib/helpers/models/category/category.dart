import 'package:location_specialist/helpers/interface/serialize_json_interface.dart';
import 'package:location_specialist/helpers/models/base/base_model.dart';
import 'package:location_specialist/helpers/models/location/location.dart';

class Category extends BaseModel implements SerializeJsonInterface {
  late String image;
  late String categoryName;
  late String description;
  late List<Location> location = [];
  Category.select(Map<String, dynamic> map) : super.fromJson(map) {
    this.categoryName = map['category_name'];
  }
  Category.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    this.categoryName = map["category_name"];
    this.description = map['description'];
    this.image = map['image'];
  }
  void setLocation(List<Location> location) {
    this.location = location;
  }

  void fromJsonLocation(Map<String, dynamic> map) {
    List<Location> location =
        map['location'].map<Location>((e) => Location.fromJson(e)).toList();
    this.setLocation(location);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{"category_name": this.categoryName}
      ..addAll(super.toJson());
  }
}
