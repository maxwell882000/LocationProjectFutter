import 'package:location_specialist/helpers/models/user/user.dart';

class Comment {
  late User user;
  late String comment;
  Comment.fromJson(Map<String, dynamic> map) {
    this.user = User.fromJson(map['user']);
    this.comment = map['comment'];
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user': this.user.toJson(),
      'comment': this.comment
    };
  }
}
