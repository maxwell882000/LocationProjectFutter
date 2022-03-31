import 'package:get/get.dart';
import 'package:location_specialist/helpers/widgets/snackbars/snackbar_handler.dart';
import 'package:location_specialist/providers/auth_provider.dart';
import 'package:location_specialist/repository/model/status.dart';
import 'package:location_specialist/routes/path.dart';

class Middleware {
  final String error;
  const Middleware(this.error);

  run() {
    this.moveToPhone();
  }

  moveToPhone() {
    if (error == "4444") {
      Get.toNamed(Path.PHONE_VALIDATION, arguments: false);
      SnackbarHandler.error(
          title: "Ошибка", body: "Ваш номер телефона не подтвержден");
    } else if (error == "5555") {
      Get.offAllNamed(Path.LOGIN, arguments: false);
      SnackbarHandler.error(
          title: "Ошибка", body: "Ваш номер телефона не подтвержден. И оператор для вашей страны не поддерживаеться." +
          "Используйте другой номер для регистрации");
    } else if (error == Status.HTTP_ERROR_401.toString()) {
      AuthProvider.token = '';
    }
  }
}
