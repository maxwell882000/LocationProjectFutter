import 'package:location_specialist/helpers/mixins/mix_comentable.dart';
import 'package:location_specialist/helpers/mixins/mix_json.dart';
import 'package:location_specialist/helpers/models/base/base_model.dart';
import 'package:location_specialist/helpers/models/category/category.dart';
import 'package:location_specialist/helpers/models/category/client_category.dart';
import 'package:location_specialist/helpers/models/location/location.dart';
import 'package:location_specialist/helpers/models/user/user.dart';

class Specialist extends BaseModel with MixJson, MixComentable {
  late String image;
  late String description;
  late User user;
  Location? location;
  List<Location> manyLocations = [];
  late List<Category> category;
  late int height;
  late int weight;
  late String dateOfBirth;
  late String education;
  late String experience;
  late List<ClientCategory> clientCategory;
  bool isDeactivated = true;
  bool isAutoPayment = false;
  late double reviewAvg;

  String get name => "${user.firstname} ${user.lastname}";

  String get firstCategory =>
      "${this.category.isNotEmpty ? this.category.first.categoryName : ''}";

  String get address => "${this.location?.name}";

  String textOfLocation({String seperator = " | "}) {
    List<Location> location = this.manyLocations;
    return location.length == 0
        ? "Выберите локацию"
        : location.map((e) => e.name).toList().join(seperator);
  }

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
    if (map.containsKey("location") && map['location'] != null)
      this.location = Location.fromJson(map['location']);
    print(map);
    if (map.containsKey("many_location") && map['many_location'] != null) {
      this.manyLocations = map['many_location']
          .map<Location>((value) => Location.fromJson(value))
          .toList();
    }
    this.isDeactivated = map['is_deactivated'];

    this.isAutoPayment = map['is_auto_payment'] ?? false;
    print(map["client_categories"]);
    if (map.containsKey("client_categories") &&
        map['client_categories'] != null)
      this.clientCategory = map['client_categories']
          .map<ClientCategory>((e) => ClientCategory.fromJson(e))
          .toList();
    this.height = map['height'] ?? 0;
    this.weight = map['weight'] ?? 0;
    this.dateOfBirth = map['date_of_birth'] ?? "";
    this.education = map['education'] ?? "";
    this.experience = map['experience'] ?? "";
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
      "education": this.education,
      "experience": this.experience,
      "height": this.height,
      "weight": this.weight,
      "date_of_birth": this.dateOfBirth,
      "many_location": this.manyLocations.map((e) => e.id).toList(),
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
