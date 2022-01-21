import 'package:location_specialist/helpers/models/base/base_model.dart';
import 'package:location_specialist/helpers/models/specialist/specialist.dart';

class User extends BaseModel {
  late String firstname;
  late String lastname;
  late String phone;
  String? token;
  Specialist? specialist;

  User() {
    firstname = "";
    lastname = "";
    phone = "";
  }

  String get name => "$firstname $lastname";
  User.decide(data) {
    if (data is int) {
      this.id = data;
    }
    if (data is Map<String, dynamic>) {
      this.fromJsonCons(data);
    }
  }

  fromJsonCons(Map<String, dynamic> map) {
    this.firstname = map['firstname'];
    this.lastname = map['lastname'];
    this.phone = map['phone'];
    if (map.containsKey('user_specialist') && map['user_specialist'] != null) {
      this.specialist = Specialist.fromJson(map['user_specialist']);
    }
    if (map.containsKey("token")) {
      this.token = map['token'];
    }
  }

  User.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    this.fromJsonCons(map);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "firstname": this.firstname,
      "lastname": this.lastname,
      "phone": this.phone,
    };
  }


  
}
