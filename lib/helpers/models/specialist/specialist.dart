import 'package:location_specialist/helpers/models/category/category.dart';
import 'package:location_specialist/helpers/models/comment/comment.dart';
import 'package:location_specialist/helpers/models/location/location.dart';
import 'package:location_specialist/helpers/models/review/review.dart';
import 'package:location_specialist/helpers/models/user/user.dart';

class Specialist {
  late String image;
  late String description;
  late User user;
  late Location location;
  late List<Category> category;
  late List<Comment> comments;
  late List<Review> reviews;
  late int review;

  Specialist.fromJson(Map<String, dynamic> map) {
    this.image = map['image'];
    this.description = map['description'];
    this.user = User.fromJson(map['user']);
    this.location = Location.fromJson(map['location']);
    this.category = map['category'].map((e) => Category.fromJson());
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "image":this.image,
      "description":this.description,
      "user":this.user.toJson(),
      "category":,
    };
  }
}
