import 'package:get/get.dart';
import 'package:location_specialist/helpers/widgets/snackbars/snackbar_handler.dart';
import 'package:location_specialist/routes/path.dart';

class Middleware {
  final String error;
  const Middleware(this.error);

  run() {
    this.moveToPhone();
  }

  moveToPhone() {
    if (error == "4444") {
      Get.offAllNamed(Path.PHONE_VALIDATION, arguments: true);
      SnackbarHandler.error(
          title: "Ошибка", body: "Ваш номер телефона не подтвержден");
    }
  }
}
