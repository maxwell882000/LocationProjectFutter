import 'package:location_specialist/helpers/models/user/auth.dart';
import 'package:location_specialist/helpers/models/user/user.dart';
import 'package:location_specialist/providers/auth_provider.dart';
import 'package:location_specialist/repository/mixin/api_base_methods.dart';
import 'package:location_specialist/repository/model/request.dart';

class AuthRepository with ApiBaseMethods {
  static final AuthRepository _singleton = AuthRepository._internal();

  factory AuthRepository() {
    return _singleton;
  }

  AuthRepository._internal();

  /* 
  phone 
  password
  */
  Future<String> getToken(Map<String, dynamic> data) async {
    var response = await this.post(Request('auth/api-token/', data: data));
    return response['token'];
  }

  Future<User> getUser() async {
    var response = await this.get(Request('auth/user/'));
    return User.fromJson(response);
  }

  Future getCheck() async {
    await this.get(Request("auth/check/"));
  }

  Future<User> createUser(Auth user) async {
    var response =
        await this.post(Request('auth/register/', data: user.toCreate()));
    AuthProvider.token = response['token'];
    return User.fromJson(response);
  }

  Future<bool> changePassword(Map<String, String> data) async {
    var response = await this.put(Request("auth/change_password/", data: data));
    return true;
  }

  Future<User> updateUser(User user) async {
    var response = await this.put(Request('auth/update/', data: user.toJson()));
    return User.fromJson(response);
  }

  Future<bool> sendCode({String suffix = ""}) async {
    var response = await this.get(new Request('auth/user/code/' + suffix));
    return response['status'];
  }

  Future<bool> validateCode(String code, {String suffix = ""}) async {
    var response = await this
        .post(new Request('auth/user/code/' + suffix, data: {'code': code}));
    return response['status'];
  }

  Future<bool> newPassword(Map<String, String> password, String phone) async {
    final response = await this.put(
      new Request("auth/forget_password/" + phone + "/", data: password),
    );
    if (response['status'] == false) {
      throw response['error'];
    }
    return response['status'];
  }
}
