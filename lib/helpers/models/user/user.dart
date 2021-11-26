import 'package:location_specialist/helpers/models/base/base_model.dart';

class User extends BaseModel {
  late String firstname;
  late String lastname;
  late String phone;
  User.fromJson(Map<String, dynamic> map):super.fromJson(map) {
    this.firstname = map['firstname'];
    this.lastname = map['lastname'];
    this.phone = map['phone'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "firstname": this.firstname,
      "lastname": this.lastname,
      "phone": this.phone,
    };
  }
}
