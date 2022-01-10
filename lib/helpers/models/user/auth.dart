import 'package:location_specialist/helpers/models/user/user.dart';

class Auth extends User {
  late String password;
  Auth.empty() {
    firstname = "";
    lastname = "";
    phone = "";
    password = "";
  }
  Auth(String phone, this.password) {
    this.phone = phone;
  }
  Auth.fromJson(Map<String, dynamic> map) : super.fromJson(map);

  Map<String, dynamic> toJson() {
    return {
      'phone': this.phone,
      'password': this.password,
    };
  }

  Map<String, dynamic> toCreate() {
    return <String, dynamic>{
      "firstname": this.firstname,
      "lastname": this.lastname,
      "phone": this.phone,
      "password": this.password
    };
  }
}
