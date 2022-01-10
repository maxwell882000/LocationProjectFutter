import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/models/error/error.dart';
import 'package:location_specialist/helpers/models/user/auth.dart';
import 'package:location_specialist/helpers/models/user/user.dart';
import 'package:location_specialist/helpers/widgets/loading/providers/loading_provider.dart';
import 'package:location_specialist/providers/auth_provider.dart';
import 'package:location_specialist/repository/auth/auth_repository.dart';
import 'package:location_specialist/routes/path.dart';

class UserProvider extends LoadingProvider {
  Auth user = new Auth.empty();

  set phone(String phone) {
    user.phone = phone;
    notifyListeners();
  }

  set password(String password) {
    user.password = password;
    notifyListeners();
  }

  set name(String name) {
    user.firstname = name;
    notifyListeners();
  }

  set lastname(String lastName) {
    user.lastname = lastName;
    notifyListeners();
  }

  Future registerUser() async {
    loading = true;
    try {
      AuthProvider.auth.user = await AuthRepository().createUser(user);
      Get.offAllNamed(Path.PHONE_VALIDATION);
    } on ErrorCustom catch (e) {
      print(e.errors);
    }
    loading = false;
  }
}
