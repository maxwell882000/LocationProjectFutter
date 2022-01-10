import 'package:location_specialist/helpers/models/comment/comment.dart';
import 'package:location_specialist/helpers/models/location/location.dart';

class CommentLocation extends Comment {
  late Location location;

  CommentLocation.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    this.location = Location.fromJson(map['location']);
  }
  Map<String, String> toJson() {
    Map<String, String> map = super.toJson();
    map['location'] = this.location.id.toString();
    return map;
  }
}
