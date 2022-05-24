import 'package:get/get.dart';
import 'package:location_specialist/helpers/widgets/phone_validation/provider/base_phone_validation_provider.dart';
import 'package:location_specialist/repository/auth/auth_repository.dart';
import 'package:location_specialist/routes/path.dart';

class PhoneValidationProvider extends BasePhoneValidationProvider {
  @override
  nextRoute() {
    Get.offAllNamed(Path.MAIN);
  }

  @override
  Future<bool> validateCode(String code) async {
    return await AuthRepository().validateCode(code);
  }

  @override
  Future<bool> sendCodeToBack() async {
    return await AuthRepository().sendCode();
  }
}
