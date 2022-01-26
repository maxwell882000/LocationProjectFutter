import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/models/error/error.dart';
import 'package:location_specialist/helpers/models/user/auth.dart';
import 'package:location_specialist/helpers/widgets/loading/providers/loading_provider.dart';
import 'package:location_specialist/helpers/widgets/snackbars/snackbar_handler.dart';
import 'package:location_specialist/providers/auth_provider.dart';
import 'package:location_specialist/repository/auth/auth_repository.dart';
import 'package:location_specialist/routes/path.dart';
import 'package:provider/provider.dart';

class LoginProvider extends LoadingProvider {
  late Auth _auth = new Auth("", "");

  Auth get auth => _auth;

  set auth(Auth auth) {
    _auth = auth;
    notifyListeners();
  }

  sendAuthorization(BuildContext context) async {
    loading = true;
    try {
      String token = await AuthRepository().getToken(_auth.toJson());
      AuthProvider.token = token;
      Provider.of<AuthProvider>(context, listen: false).fetchUserData();
      notifyListeners();
      Get.offNamed(Path.MAIN);
    } on ErrorCustom catch (e) {
      SnackbarHandler.error(
          title: "Ошибка".tr, body: "Ваши введенные даные неверны".tr);
    }
    loading = false;
  }
}
