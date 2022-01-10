import 'package:location_specialist/helpers/models/comment/comment.dart';
import 'package:location_specialist/helpers/models/review/review.dart';

mixin MixComentable {
  Review? review;
  List<Comment> comments = [];

  void setComment(Map<String, dynamic> map) {
    this.comments =
        map['comments'].map<Comment>((e) => Comment.fromJson(e)).toList();
  }

}
