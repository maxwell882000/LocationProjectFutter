import 'package:get/get.dart';
import 'package:location_specialist/helpers/widgets/loading/providers/loading_provider.dart';
import 'package:location_specialist/helpers/widgets/snackbars/snackbar_handler.dart';
import 'package:location_specialist/repository/auth/auth_repository.dart';
import 'package:location_specialist/routes/path.dart';

class ForgetPasswordProvider extends LoadingProvider {
  late final Map<String, String> formPassword = {};
  late final String phone;

  String get password => formPassword['password']!;

  String get repPassword => formPassword['repPassword']!;

  ForgetPasswordProvider() {
    phone = Get.arguments as String;
  }

  set password(String password) {
    formPassword['password'] = password;
    notifyListeners();
  }

  set repPassword(String password) {
    formPassword['repPassword'] = password;
    notifyListeners();
  }

  Future changePassword() async {
    if (password != repPassword) {
      return SnackbarHandler.error(
          title: "Ошибка", body: "Пароли не совподают!");
    }
    try {
      await AuthRepository().newPassword(formPassword, phone);
      Get.offAllNamed(Path.LOGIN);
      SnackbarHandler.success(
          title: "Успех", body: "Вы успешно изменили пароль!");
    } catch (e) {
      print(e);
      SnackbarHandler.error(
          title: "Ошибка", body: "Произошла ошибка попытайтесь позже");
    }
  }
}
