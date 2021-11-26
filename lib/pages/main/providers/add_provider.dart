import 'package:flutter/cupertino.dart';
import 'package:location_specialist/helpers/models/add/add.dart';
import 'package:location_specialist/helpers/models/base/base_provider.dart';
import 'package:location_specialist/repository/add/add_repository.dart';

class AddProvider  extends BaseProvider {
  List<Add> _adds = [];

  List<Add> get adds => _adds;

  set adds(List<Add> adds) {
    _adds = adds;
    notifyListeners();
  }

  
  initAsync() async {
    this.adds = await AddRepository().addList();
  }
}
