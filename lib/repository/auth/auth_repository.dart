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
    print(response);
    return User.fromJson(response);
  }

  Future<User> createUser(Auth user) async {
    var response =
        await this.post(Request('auth/register/', data: user.toCreate()));
    AuthProvider.token = response['token'];
    return User.fromJson(response);
  }

  Future<User> updateUser(Auth user) async {
    var response =
        await this.put(Request('auth/update/', data: user.toCreate()));
    return response['token'];
  }

  Future<bool> sendCode() async {
    var response = await this.get(new Request('auth/user/code/'));
    return response['status'];
  }

  Future<bool> validateCode(String code) async {
    var response =
        await this.post(new Request('auth/user/code/', data: {'code': code}));
    return response['status'];
  }
}
