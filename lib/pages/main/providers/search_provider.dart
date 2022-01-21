import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:location_specialist/helpers/models/base/base_provider.dart';
import 'package:location_specialist/helpers/models/location/location.dart';
import 'package:location_specialist/repository/location/location_repository.dart';

class SearchProvider extends BaseProvider {
  late TextEditingController controller;
  bool _disposed = false;

  bool get disposed => _disposed;

  set disposed(bool disposed) {
    _disposed = disposed;
    notifyListeners();
  }

  List<Location> _location = [];

  List<Location> get location => _location;

  set location(List<Location> location) {
    _location = location;
    if (!this._disposed) notifyListeners();
  }

  SearchProvider() {
    controller = new TextEditingController();
  }
  void listnerText() async {
    if (controller.text.isNotEmpty)
      this.location =
          (await LocationRepository().locationListSearch(controller.text)).list;
  }

  @override
  initAsync() {}
}
