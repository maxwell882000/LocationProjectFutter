import 'package:get/get.dart';
import 'package:location_specialist/helpers/widgets/phone_validation/provider/base_phone_validation_provider.dart';
import 'package:location_specialist/helpers/widgets/phone_validation/widgets/base_phone_validation.dart';
import 'package:location_specialist/repository/auth/auth_repository.dart';
import 'package:location_specialist/routes/path.dart';

class ForgetCodeVerificationProvider extends BasePhoneValidationProvider {
  late final phone;

  ForgetCodeVerificationProvider() : super() {
    phone = Get.arguments as String;
  }

  @override
  nextRoute() {
    Get.toNamed(Path.FORGET_PASSWORD, arguments: phone);
  }

  @override
  Future<bool> validateCode(String code) async {
    return await AuthRepository().validateCode(code, suffix: phone + '/');
  }

  @override
  Future<bool> sendCodeToBack() async {
    return await AuthRepository().sendCode(suffix: phone + '/');
  }
}
