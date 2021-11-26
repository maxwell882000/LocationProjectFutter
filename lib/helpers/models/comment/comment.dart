import 'package:location_specialist/helpers/interface/serialize_json_interface.dart';
import 'package:location_specialist/helpers/models/base/base_model.dart';
import 'package:location_specialist/helpers/models/user/user.dart';

class Comment extends BaseModel implements SerializeJsonInterface {
  late User user;
  late String comment;
  Comment.fromJson(Map<String, dynamic> map) :super.fromJson(map) {
    this.user = User.fromJson(map['user']);
    this.comment = map['comment'];
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user': this.user.id,
      'comment': this.comment
    };
  }
}
