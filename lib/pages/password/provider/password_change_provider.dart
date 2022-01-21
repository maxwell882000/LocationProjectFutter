import 'package:get/get.dart';
import 'package:location_specialist/helpers/models/error/error.dart';
import 'package:location_specialist/helpers/widgets/loading/providers/loading_provider.dart';
import 'package:location_specialist/helpers/widgets/snackbars/snackbar_handler.dart';
import 'package:location_specialist/repository/auth/auth_repository.dart';

class PasswordChangeProvider extends LoadingProvider {
  String password = "";
  String newPassword = "";
  String repeatPassword = "";

  changePassword() async {
    if (newPassword != repeatPassword) {
      return SnackbarHandler.error(
          title: "Ошибка", body: "Пароли должны совпадать!");
    }
    loading = true;
    try {
      await AuthRepository().changePassword({
        "old_password": password,
        "new_password": newPassword,
      });
      Get.back();
     return SnackbarHandler.success(title: "Успех", body: "Вы изменили свой пароль!");
    } on ErrorCustom catch (e) {
      if (e.errors
          .where((element) => element.containsKey('old_password'))
          .isNotEmpty) {
        SnackbarHandler.error(
            title: "Ошибка", body: "Введите правильный пароль!");
      } else {
        SnackbarHandler.error(title: "Ошибка", body: e.errors.toString());
      }
    }
    loading = false;
  }
}
