import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:location_specialist/helpers/models/confidential/confidential.dart';
import 'package:location_specialist/pages/category/widgets/category_view.dart';
import 'package:location_specialist/pages/confedentials/views/confidential_view.dart';
import 'package:location_specialist/pages/confedentials/views/sale_text_view.dart';
import 'package:location_specialist/pages/error/widget/not_internet.dart';
import 'package:location_specialist/pages/forget_password/view/forget_password.dart';
import 'package:location_specialist/pages/forget_password/view/forget_code_verification.dart';
import 'package:location_specialist/pages/forget_password/view/forget_phone.dart';
import 'package:location_specialist/pages/initial/initial.dart';
import 'package:location_specialist/pages/location/widgets/location_comment.dart';
import 'package:location_specialist/pages/location/widgets/location_view.dart';
import 'package:location_specialist/pages/location/widgets_form/city_search.dart';
import 'package:location_specialist/pages/location/widgets_form/geocoding.dart';
import 'package:location_specialist/pages/location/widgets_form/location_form.dart';
import 'package:location_specialist/pages/login/login.dart';
import 'package:location_specialist/pages/main/main.dart';
import 'package:location_specialist/pages/main/widgets/home/search.dart';
import 'package:location_specialist/pages/password/widgets/password-change.dart';
import 'package:location_specialist/pages/payment/widgets/payment.dart';
import 'package:location_specialist/pages/register/choice/choice-registration.dart';
import 'package:location_specialist/pages/register/phone-validation/phone_validation.dart';
import 'package:location_specialist/pages/register/specialist/choose-location.dart';
import 'package:location_specialist/pages/register/specialist/specialist-register.dart';
import 'package:location_specialist/pages/register/specialist/user-register-first.dart';
import 'package:location_specialist/pages/register/user/user-register.dart';
import 'package:location_specialist/pages/specialist/widgets/specialist_view.dart';
import 'package:location_specialist/routes/path.dart';

class Routes {
  static const INITIAL = Path.INITIAL;
  static final routes = [
    GetPage(page: () => Initial(), name: Path.INITIAL),
    GetPage(name: Path.LOGIN, page: () => Login()),
    GetPage(name: Path.REGISTER_CHOOSE, page: () => ChoiceRegistration()),
    GetPage(name: Path.REGISTER_SPECIALIST, page: () => SpecialistRegister()),
    GetPage(name: Path.CHOOSE_LOCATION, page: () => ChooseLocation()),
    GetPage(name: Path.REGISTER_USER_FIRST, page: () => UserRegisterFisrt()),
    GetPage(name: Path.REGISTER_USER, page: () => UserRegister()),
    GetPage(name: Path.MAIN, page: () => Main()),
    GetPage(name: Path.CATEGORY_PROFILE, page: () => CategoryView()),
    GetPage(name: Path.LOCATION_PROFILE, page: () => LocationView()),
    GetPage(name: Path.SPECIALIST_PROFILE, page: () => SpecialistView()),
    GetPage(name: Path.SEARCH, page: () => SearchMap()),
    GetPage(name: Path.LOCATION_COMMENT, page: () => LocationComment()),
    GetPage(name: Path.PHONE_VALIDATION, page: () => PhoneValidation()),
    GetPage(name: Path.LOCATION_FORM, page: () => LocationForm()),
    GetPage(name: Path.CHANGE_PASSWORD, page: () => PasswordChange()),
    GetPage(name: Path.CONFIDENTIAL, page: () => ConfidentialView()),
    GetPage(name: Path.NOT_INTERNET, page: () => NotInternet()),
    GetPage(name: Path.GEOCODING, page: () => Geocoding()),
    GetPage(name: Path.SEARCH_CITY, page: () => CitySearch()),
    GetPage(name: Path.PAYMENT, page: () => Payment()),
    GetPage(name: Path.SALES_TEXT, page: () => SaleTextView()),
    GetPage(name: Path.FORGET_PASSWORD, page: () => ForgetPassword()),
    GetPage(
        name: Path.FORGET_PASSWORD_CODE_VERIFICATION,
        page: () => ForgetCodeVerification()),
    GetPage(name: Path.FORGET_PHONE, page: () => ForgetPhone()),
  ];
}
