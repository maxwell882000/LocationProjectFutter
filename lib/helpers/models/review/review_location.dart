import 'package:location_specialist/helpers/models/location/location.dart';
import 'package:location_specialist/helpers/models/review/review.dart';

class ReviewLocation extends Review {
  final int location;

  ReviewLocation(
      {required int review,  int user = 0, required this.location})
      : super(review: review, user: user);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = super.toJson();
    map['location'] = this.location.toString();
    return map;
  }
  /*  ReviewLocation.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    this.location = Location.fromJson(map['location']);
  } */
}
