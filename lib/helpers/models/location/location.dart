import 'package:location_specialist/helpers/mixins/mix_comentable.dart';
import 'package:location_specialist/helpers/models/base/base_model.dart';
import 'package:location_specialist/helpers/models/category/category.dart';
import 'package:location_specialist/helpers/models/comment/comment.dart';
import 'package:location_specialist/helpers/models/image/image.dart';
import 'package:location_specialist/helpers/models/specialist/specialist.dart';

class Location extends BaseModel with MixComentable {
  late String country;
  late String city;
  late String district;
  late String description;
  late double latitude;
  late double longitude;
  late List<Image> images;
  late bool parking;
  late String comfort;
  late bool functionLess;
  late double reviewAvg;
  late List<Category> category;
  String? _name;

  List<Specialist> specialist = [];
  Location.search(Map<String, dynamic> map) {
    this.id = map['id'];
    this.city = map['city'];
    this.country = map['country']['country'];
    this.district = "";
  }
  Location.gecoding(
      {required String name, required this.latitude, required this.longitude}) {
    this._name = name;
  }
  Location.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    this.country = map['country'];
    this.city = map['city'];
    this.parking = map['parking'];
    this.comfort = map['comfort'];
    this.functionLess = map['function_less'];
    this.district = map['district'];
    this.reviewAvg = map['review_avg'] ?? 0.0;
    this.description = map['description'];
    this.latitude = map['latitude'];
    this.longitude = map['longitude'];
    this.images = map['images'].map<Image>((e) => Image.fromJson(e)).toList();
    this.category =
        map['category'].map<Category>((e) => Category.fromJson(e)).toList();
  }
  String get name =>
      this._name ??
      (this.district != ""
          ? "${this.country}, ${this.city}, ${this.district}"
          : "${this.country}, ${this.city}");

  void setSpecialist(List<Specialist> specialist) {
    this.specialist = specialist;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'country': this.country,
      'city': this.city,
      'district': this.district,
      'description': this.description,
      'latitude': this.latitude.toString(),
      'longitude': this.longitude.toString(),
    };
  }
}
