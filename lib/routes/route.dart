import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:location_specialist/pages/initial/initial.dart';
import 'package:location_specialist/pages/login/login.dart';
import 'package:location_specialist/pages/main/main.dart';
import 'package:location_specialist/pages/register/choice/choice-registration.dart';
import 'package:location_specialist/pages/register/specialist/specialist-register.dart';
import 'package:location_specialist/pages/register/user/user-register.dart';
import 'package:location_specialist/routes/path.dart';

class Routes {
  static const INITIAL = Path.LOGIN;
  static final routes = [
    GetPage(page: () => Initial(), name: Path.INITIAL),
    GetPage(name: Path.LOGIN, page: () => Login()),
    GetPage(name: Path.REGISTER_CHOOSE, page: () => ChoiceRegistration()),
    GetPage(name: Path.REGISTER_SPECIALIST, page: () => SpecialistRegister()),
    GetPage(name: Path.REGISTER_USER, page: () => UserRegister()),
    GetPage(name: Path.MAIN, page: () => Main())
  ];
}
