import 'package:location_specialist/helpers/interface/serialize_json_interface.dart';
import 'package:location_specialist/helpers/models/base/base_model.dart';
import 'package:location_specialist/helpers/models/user/user.dart';

class Comment extends BaseModel implements SerializeJsonInterface {
  late User user;
  late String comment;
  late String date;
  Comment.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    this.user = User.decide(map['user']);
    this.comment = map['comment'];
    this.date = map['date'];
  }
  Map<String, String> toJson() {
    return <String, String>{
      'user': this.user.id.toString(),
      'comment': this.comment
    };
  }
}
