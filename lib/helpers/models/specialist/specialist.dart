import 'package:location_specialist/helpers/mixins/mix_comentable.dart';
import 'package:location_specialist/helpers/mixins/mix_json.dart';
import 'package:location_specialist/helpers/models/base/base_model.dart';
import 'package:location_specialist/helpers/models/category/category.dart';
import 'package:location_specialist/helpers/models/comment/comment.dart';
import 'package:location_specialist/helpers/models/location/location.dart';
import 'package:location_specialist/helpers/models/user/user.dart';

class Specialist extends BaseModel with MixJson, MixComentable {
  late String image;
  late String description;
  late User user;
  late Location location;
  late List<Category> category;

  late double reviewAvg;
  String get name => "${user.firstname} ${user.lastname}";
  String get firstCategory => "${this.category.isNotEmpty?this.category.first.categoryName : ''}";
  String get address => "${this.location.name}";
  Specialist.create(Map<String, dynamic> map) : super.fromJson(map) {
    print(image);
    this.image = map['image'];
    this.description = map['description'];
    this.setUser(map);
  }
    Specialist.update(Map<String, dynamic> map) : super.fromJson(map) {
    this.image = map['image'];
    this.description = map['description'];
    this.setUser(map);
  }

  setUser(Map<String, dynamic> map) {
    if (map.containsKey('user')) {
      this.user = User.fromJson(map['user']);
    }
  }

  Specialist.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    this.image = map['image'];
    this.description = map['description'];
    this.setUser(map);
    this.location = Location.fromJson(map['location']);
    this.category =
        map['category'].map<Category>((e) => Category.fromJson(e)).toList();
    this.reviewAvg = map['review_avg'] ?? 0.0;
  }

  Specialist.fromJsonCard(Map<String, dynamic> map) : super.fromJson(map) {
    this.image = map['image'];
    this.setUser(map);
    this.location = Location.fromJson(map['location']);
    this.category =
        map['category'].map<Category>((e) => Category.fromJson(e)).toList();
    this.reviewAvg = map['review_avg'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "image": this.image,
      "description": this.description,
      "user": this.user.toJson(),
      "category": this.toJsonList(this.category),
    };
  }

  Map<String, dynamic> toUpdate() {
    var map = <String, dynamic>{
      "description": this.description,
      "location": this.location.id,
    };
    try {
      map['image'] = int.parse(this.image);
    } catch (e) {}
    return map;
  }
}
/* For now it is not necessary */
/*   late List<ReviewSpecialist> reviews; */
 /*    this.reviews = map['reviews']
        .map<ReviewSpecialist>((e) => ReviewSpecialist.fromJson(e))
        .toList(); */