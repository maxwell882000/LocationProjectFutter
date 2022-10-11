import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/models/error/error.dart';
import 'package:location_specialist/helpers/models/location/location.dart';
import 'package:location_specialist/helpers/models/media/media.dart';
import 'package:location_specialist/helpers/models/user/auth.dart';
import 'package:location_specialist/helpers/models/user/user.dart';
import 'package:location_specialist/helpers/widgets/loading/providers/loading_provider.dart';
import 'package:location_specialist/helpers/widgets/snackbars/snackbar_handler.dart';
import 'package:location_specialist/providers/auth_provider.dart';
import 'package:location_specialist/repository/auth/auth_repository.dart';
import 'package:location_specialist/repository/common/common_repository.dart';
import 'package:location_specialist/repository/specialist/specialist_repository.dart';
import 'package:location_specialist/routes/path.dart';
import 'package:provider/provider.dart';

class UserEditProvider extends LoadingProvider {
  User user = new Auth.empty();
  List<int> category = [];
  TextEditingController dateController = TextEditingController();
  List<int> clientCategory = [];

  set location(Location? location) {
    if (location != null) {
      user.specialist!.location = location;
      notifyListeners();
    }
  }

  set phone(String phone) {
    user.phone = phone;
    notifyListeners();
  }

  String textOfLocation() {
    return this.user.specialist!.location?.name ?? "Выберите локацию";
  }

  setLocation() async {
    var object = await Get.toNamed(Path.CHOOSE_LOCATION);
    if (object != null) {
      this.location = object as Location?;
    }
  }

  set name(String name) {
    user.firstname = name;
    notifyListeners();
  }

  set lastname(String lastName) {
    user.lastname = lastName;
    notifyListeners();
  }

  setDescription(String? text) {
    user.specialist!.description = text!;
  }

  setExperience(String? text) {
    user.specialist!.experience = text!;
  }

  setEducation(String? text) {
    user.specialist!.education = text!;
  }

  UserEditProvider(BuildContext context) {
    this.user = Provider.of<AuthProvider>(context, listen: false).user!;

    if (user.specialist != null) {
      this.category = user.specialist!.category.map<int>((e) => e.id).toList();
      this.clientCategory =
          user.specialist!.clientCategory.map<int>((e) => e.id).toList();
      this.dateController.text = user.specialist!.dateOfBirth;
      print(user.specialist!.clientCategory
          .map<String>((e) => e.name)
          .toList());
    }
  }

  Future setImage(Media media) async {
    try {
      user.specialist!.image =
          "${await CommonRepository().createImageTemp(media)}";
    } catch (e) {}
  }

  deleteImage() async {
    int id = int.parse(user.specialist!.image);
    user.specialist!.image = "";
    await CommonRepository().deleteImageTemp(id);
  }

  setCategory(List<int> ids) {
    this.category = ids;
  }

  setDate(String? text) {
    user.specialist!.dateOfBirth = text!;
  }

  setClientCategories(List<int> ids) {
    this.clientCategory = ids;
  }

  setHeight(String? height) {
    if (height != "") user.specialist!.height = int.parse(height ?? "0");
  }

  setWeight(String? weight) {
    if (weight != "") user.specialist!.weight = int.parse(weight ?? "0");
  }

  updateProfile(BuildContext context) async {
    loading = true;
    try {
      var provider = Provider.of<AuthProvider>(context, listen: false);
      if (user.specialist != null) {
        Map<String, dynamic> map = user.specialist!.toUpdate();
        map['user'] = user.toJson();
        map['category'] = category;
        map['client_categories'] = clientCategory;
        var specialist = (await SpecialistRepository()
            .specialistUpdate(user.specialist!.id, map));
        this.user = specialist.user;
        this.user.specialist = specialist;
        provider.user = user;
      } else {
        this.user = await AuthRepository().updateUser(user);
        provider.user = user;
      }
      SnackbarHandler.success(
          title: "Успех", body: "Вы успешно обновили профиль");
    } on ErrorCustom catch (e) {
      if (e.errors
          .where((element) => element.containsKey('phone'))
          .isNotEmpty) {
        SnackbarHandler.error(title: "Ошибка", body: "Такой номер уже занят");
      } else if (e.errors
          .where((element) => element.containsKey('category'))
          .isNotEmpty) {
        SnackbarHandler.error(
            title: "Ошибка", body: "Пожалуйста выберите категорию");
      } else if ((e.errors
          .where((element) =>
              element.containsKey('user') &&
              element['user'].containsKey('phone'))
          .isNotEmpty)) {
        SnackbarHandler.error(title: "Ошибка", body: "Такой номер уже занят");
      } else {
        SnackbarHandler.error(title: "Ошибка", body: e.errors.toString());
      }
    }
    loading = false;
  }
}
