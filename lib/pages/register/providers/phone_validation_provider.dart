import 'package:get/get.dart';
import 'package:location_specialist/helpers/widgets/loading/providers/loading_provider.dart';
import 'package:location_specialist/helpers/widgets/snackbars/snackbar_handler.dart';
import 'package:location_specialist/repository/auth/auth_repository.dart';
import 'package:location_specialist/routes/path.dart';

class PhoneValidationProvider extends LoadingProvider {
  late String? _code;

  String? get code => _code;
  PhoneValidationProvider() {
    if (Get.arguments == true) {
      startSendCode();
    }
  }

  startSendCode() async {
    loading = true;
    await sendCode();
    loading = false;
  }

  startConfirmCode() async {
    loading = true;
    await confirmCode();
    loading = false;
  }

  Future confirmCode() async {
    print(code);
    if (code == null || code == "") {
      return SnackbarHandler.error(title: "Ошибка".tr, body: "Введите код".tr);
    }
    final response = await AuthRepository().validateCode(code!);
    if (response) {
      Get.offAllNamed(Path.MAIN);
      SnackbarHandler.success(
          title: "Успех".tr, body: "Код  был успешно подтвержден".tr);
    } else {
      SnackbarHandler.error(
          title: "Ошибка".tr, body: "Код  подтверждения неверен".tr);
    }
  }

  Future sendCode() async {
    try {
      if (!(await AuthRepository().sendCode())) {
        sendCode();
      } else {
        SnackbarHandler.success(
            title: "Успех".tr,
            body: "Код подтверждения был успешно отправлен".tr);
      }
    } catch (e) {
      print("Error code send");
      print(e);
      SnackbarHandler.success(
          title: "Ошибка".tr, body: "Произошла ошибка во время отправки".tr);
    }
  }

  set code(String? code) {
    _code = code;
    notifyListeners();
  }
}
