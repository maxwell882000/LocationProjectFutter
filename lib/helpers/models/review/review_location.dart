import 'package:location_specialist/helpers/models/location/location.dart';
import 'package:location_specialist/helpers/models/review/review.dart';

class ReviewLocation extends Review {
  late Location location;

  ReviewLocation.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    this.location = Location.fromJson(map['location']);
  }
}
