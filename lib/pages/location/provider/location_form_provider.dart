import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_specialist/helpers/models/error/error.dart';
import 'package:location_specialist/helpers/models/image/image.dart' as image;
import 'package:location_specialist/helpers/models/location/location.dart';
import 'package:location_specialist/helpers/models/media/media.dart';
import 'package:location_specialist/helpers/widgets/image_picker/image-container.dart';
import 'package:location_specialist/helpers/widgets/loading/providers/loading_provider.dart';
import 'package:location_specialist/helpers/widgets/snackbars/snackbar_handler.dart';
import 'package:location_specialist/repository/location/location_repository.dart';

class LocationFormProvider extends LoadingProvider {
  final List<ImageContainer> storeImages = [];
  final Map<UniqueKey, image.Image> images = {};
  int _numberOfImages = 0;
  String _city = "Найти город";

  String get city => _city;

  set city(String city) {
    _city = city;
    notifyListeners();
  }

  final Map<String, dynamic> _fromValues = {
    'parking': false,
    'function_less': false,
  };
  Map<String, dynamic> get fromValues => _fromValues;
  bool checkImageAlreadyUploaded(UniqueKey key) {
    return images[key] != null;
  }

  Future setImage(Media media, UniqueKey key) async {
    if (!checkImageAlreadyUploaded(key))
      images[key] = await LocationRepository().uploadImage(media);
  }

  setOverallNumber(int number) {
    this._numberOfImages = number;
  }

  setCoordinates(LatLng latLng) {
    this.setLocations("latitude", latLng.latitude);
    this.setLocations("longitude", latLng.longitude);
  }

  Future deleteImage(UniqueKey key) async {
    if (images.containsKey(key) &&
        images[key] != null &&
        images[key]?.id != null) {
      await LocationRepository().deleteImage(images[key]!.id);
      this._numberOfImages--;
      notifyListeners();
    }
  }

  List<int> getImages() {
    return this.images.entries.map<int>((entry) => entry.value.id).toList();
  }

  void setCity(Location location) {
    this._fromValues['city'] = location.id;
    this.city = location.name;
  }

  void setLocations(String key, dynamic value) {
    _fromValues[key] = value;
    notifyListeners();
  }

  clean() {
    images.clear();
    _numberOfImages = 0;
    _city = "Найти город";
    storeImages.clear();
    _fromValues.clear();
  }

  Future submit() async {
    loading = true;
    var images = this.getImages();
    if (images.length != this._numberOfImages) {
      loading = false;
      return SnackbarHandler.error(
          title: "Ошибка", body: "Подождите пока прогрузяться все фото");
    }
    this._fromValues['images'] = images;
    try {
      await LocationRepository().createLocation(this._fromValues);
      clean();
    } on ErrorCustom catch (e) {
      if ((e.getFirst("latitude")).isNotEmpty) {
        SnackbarHandler.error(title: "Ошибка", body: "Выберите локацию");
      } else {
        SnackbarHandler.error(
            title: "Ошибка", body: "Произошла неизвестная ошибка");
      }
      loading = false;

      return;
    }
    loading = false;
    Get.back();
    SnackbarHandler.success(
        title: "Успех", body: "Локация отправлена на модерацию");
/*      */
  }
}
