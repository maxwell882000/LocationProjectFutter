import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/models/error/error.dart';
import 'package:location_specialist/helpers/models/location/location.dart';
import 'package:location_specialist/helpers/models/media/media.dart';
import 'package:location_specialist/helpers/models/specialist/specialist.dart';
import 'package:location_specialist/helpers/widgets/loading/providers/loading_provider.dart';
import 'package:location_specialist/helpers/widgets/snackbars/snackbar_handler.dart';
import 'package:location_specialist/providers/auth_provider.dart';
import 'package:location_specialist/repository/common/common_repository.dart';
import 'package:location_specialist/repository/specialist/specialist_repository.dart';
import 'package:location_specialist/routes/path.dart';
import 'package:provider/provider.dart';

class SpecialistRegisterProvider extends LoadingProvider {
  final Map<String, dynamic> _formValues = {};
  Location? _location;
  bool _customLocation = false;

  bool get customLocation => _customLocation;

  set customLocation(bool customLocation) {
    _customLocation = customLocation;
    print(_customLocation);
    notifyListeners();
  }
  Location? get location => _location;

  set location(Location? location) {
    _location = location;
    _formValues['location'] = _location!.id;
    notifyListeners();
  }

  SpecialistRegisterProvider() {
    _formValues['user'] = Get.arguments as Map;
  }

  setDescription(String? description) {
    _formValues["description"] = description;
  }

  Future setImage(Media media) async {
    _formValues['image'] = await CommonRepository().createImageTemp(media);
  }

  static SpecialistRegisterProvider provider(BuildContext context) {
    return Provider.of<SpecialistRegisterProvider>(context, listen: false);
  }

  deleteImage() async {
    int id = _formValues.remove("image");
    await CommonRepository().deleteImageTemp(id);
  }

  setLocation() async {
    var object = await Get.toNamed(Path.CHOOSE_LOCATION);
    if (object != null) {
      this.location = object as Location?;
    }
  }

  setCategory(List ids) {
    _formValues['category'] = ids;
  }

  setCustomLocation(String ?location) {
    _formValues['custom_location'] = location;
  }

  String textOfLocation() {
    return this._location == null ? "Найти локацию" : this._location!.name;
  }

  registerSpecialist() async {
    if (!_formValues.containsKey("image")) {
      return SnackbarHandler.error(
          title: "Ошибка", body: "Пожалуйста загрузита автарку");
    }
    if (!_formValues.containsKey('location')) {
      return SnackbarHandler.error(
          title: "Ошибка", body: "Пожалуйста выберите локацию");
    }
    if (!_formValues.containsKey('category') && _formValues['category'] == []) {
      return SnackbarHandler.error(
          title: "Ошибка", body: "Пожалуйста выберите вид деятельности");
    }
    loading = true;
    try {
      Specialist specialist =
          await SpecialistRepository().specialistCreate(_formValues);
      AuthProvider.auth.user = specialist.user;
      AuthProvider.auth.user!.specialist = specialist;
      AuthProvider.token = specialist.user.token;
      Get.offAllNamed(Path.PHONE_VALIDATION);
    } on ErrorCustom catch (e) {
      if ((e.errors
          .where((element) =>
              element.containsKey('user') &&
              element['user'].containsKey('phone'))
          .isNotEmpty)) {
        SnackbarHandler.error(title: "Ошибка", body: "Такой номер уже занят");
        e.errors.removeRange(0, 1);
      } else if (e.errors
          .where((element) => element.containsKey('phone_sms'))
          .isNotEmpty) {
        SnackbarHandler.error(
            title: "Ошибка",
            body: e.errors
                .where((element) => element.containsKey('phone_sms'))
                .first['phone_sms'] as String);
      } else {
        SnackbarHandler.error(title: "Ошибка", body: e.errors.toString());
      }
    }
    loading = false;
  }
}
