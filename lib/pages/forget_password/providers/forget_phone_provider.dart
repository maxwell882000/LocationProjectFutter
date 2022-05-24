import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/loading/providers/loading_provider.dart';
import 'package:location_specialist/repository/auth/auth_repository.dart';
import 'package:location_specialist/routes/path.dart';

import '../../../helpers/widgets/snackbars/snackbar_handler.dart';

class ForgetPhoneProvider extends LoadingProvider {
  late String _phone;

  String get phone => _phone;

  set phone(String phone) {
    _phone = phone;
    notifyListeners();
  }

  validatePhone() async {
    loading = true;
    try {
      await AuthRepository().sendCode(suffix: phone);
      Get.toNamed(Path.FORGET_PASSWORD_CODE_VERIFICATION, arguments: phone);
    } catch (e) {
      SnackbarHandler.error(title: "Ошибка", body: "Не правильный номер!");
    }
    loading = false;
  }
}
