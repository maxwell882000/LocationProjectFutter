import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:location_specialist/pages/category/widgets/category_view.dart';
import 'package:location_specialist/pages/initial/initial.dart';
import 'package:location_specialist/pages/location/widgets/location_view.dart';
import 'package:location_specialist/pages/login/login.dart';
import 'package:location_specialist/pages/main/main.dart';
import 'package:location_specialist/pages/main/widgets/category/category_item.dart';
import 'package:location_specialist/pages/main/widgets/home/search.dart';
import 'package:location_specialist/pages/register/choice/choice-registration.dart';
import 'package:location_specialist/pages/register/specialist/specialist-register.dart';
import 'package:location_specialist/pages/register/user/user-register.dart';
import 'package:location_specialist/pages/specialist/widgets/specialist_view.dart';
import 'package:location_specialist/routes/path.dart';

class Routes {
  static const INITIAL = Path.MAIN;
  static final routes = [
    GetPage(page: () => Initial(), name: Path.INITIAL),
    GetPage(name: Path.LOGIN, page: () => Login()),
    GetPage(name: Path.REGISTER_CHOOSE, page: () => ChoiceRegistration()),
    GetPage(name: Path.REGISTER_SPECIALIST, page: () => SpecialistRegister()),
    GetPage(name: Path.REGISTER_USER, page: () => UserRegister()),
    GetPage(name: Path.MAIN, page: () => Main()),
    GetPage(name: Path.CATEGORY_PROFILE, page: () => CategoryView()),
    GetPage(name: Path.LOCATION_PROFILE, page: () => LocationView()),
    GetPage(name: Path.SPECIALIST_PROFILE, page: () => SpecialistView()),
    GetPage(name: Path.SEARCH, page: () => SearchMap()),
  ];
}
