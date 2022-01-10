import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_specialist/helpers/models/image/image.dart' as image;
import 'package:location_specialist/helpers/models/media/media.dart';
import 'package:location_specialist/helpers/widgets/loading/providers/loading_provider.dart';
import 'package:location_specialist/helpers/widgets/snackbars/snackbar_handler.dart';
import 'package:location_specialist/repository/location/location_repository.dart';

class LocationFormProvider extends LoadingProvider {
  final Map<UniqueKey, image.Image> images = {};
  int _numberOfImages = 0;
  final Map<String, dynamic> _fromValues = {
    'parking': false,
    'function_less': false,
  };

  Future setImage(Media media, UniqueKey key) async {
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

  void setLocations(String key, dynamic value) {
    _fromValues[key] = value;
    notifyListeners();
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
    await LocationRepository().createLocation(this._fromValues);
    loading = false;
    Get.back();
    SnackbarHandler.success(
        title: "Успех", body: "Локация отправлена на модерацию");
/*      */
  }
}