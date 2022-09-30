import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/models/error/error.dart';
import 'package:location_specialist/helpers/models/user/user.dart';
import 'package:location_specialist/repository/auth/auth_repository.dart';
import 'package:location_specialist/repository/payment/payment_repository.dart';
import 'package:location_specialist/routes/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/widgets/snackbars/snackbar_handler.dart';

class AuthProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;
  static late AuthProvider auth;

  AuthProvider() {
    auth = this;
  }

  set user(User? user) {
    _user = user;
    notifyListeners();
  }

  void activateSpecialist(bool isAutoPayment) {
    user?.specialist?.isDeactivated = false;
    this._setAutoPayment = isAutoPayment;
  }

  void activateAutoPayment() {
    this._setAutoPayment = true;
  }

  void deactivateAutoPayment() {
    this._setAutoPayment = false;
  }

  set _setAutoPayment(bool auto) {
    user?.specialist?.isAutoPayment = auto;
    notifyListeners();
  }

  static late SharedPreferences shared;
  static late String? _token;

  static String? get token => _token;

  static set token(String? token) {
    _token = token;
    shared.setString("token", token ?? "");
  }

  static String getToken() {
    if (isAuthorized()) {
      return "Token " + token!;
    }
    return "";
  }

  Future init() async {
    shared = await SharedPreferences.getInstance();
    AuthProvider._token = shared.getString("token");
  }

  Future fetchUserData() async {
    this.user = await AuthRepository().getUser();
  }

  static bool isAuthorized() {
    return token != null && token != "";
  }

  Future deactivateSub() async {
    try {
      await PaymentRepository().unBind();
      this.deactivateAutoPayment();
    } on ErrorCustom catch (e) {
      SnackbarHandler.error(title: "Ошибка", body: e.errors.toString());
    }
  }

  logout() {
    shared.remove('token');
    _token = "";
    user = null;
    Get.offAllNamed(Path.LOGIN);
  }
}
