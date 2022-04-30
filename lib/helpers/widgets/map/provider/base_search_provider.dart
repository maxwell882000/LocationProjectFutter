import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/models/base/base_provider.dart';

import '../../../models/location/location.dart';

abstract class BaseSearchProvider extends BaseProvider {
  late TextEditingController controller = new TextEditingController();
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
    if (!this.disposed) notifyListeners();
  }

  void listnerText();
  String hintText() {
    return "Введите Адрес";
  }

  @override
  initAsync() {}
}
