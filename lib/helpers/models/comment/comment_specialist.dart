import 'package:location_specialist/helpers/models/comment/comment.dart';
import 'package:location_specialist/helpers/models/specialist/specialist.dart';

class CommentSpecialist extends Comment {
  late Specialist specialist;

  CommentSpecialist.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    this.specialist = Specialist.fromJson(map['specialist']);
  }
    Map<String, dynamic> toJson() {
    Map<String, dynamic> map = super.toJson();
    map['location'] = this.specialist.id;
    return map;
  }
}
