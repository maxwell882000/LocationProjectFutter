import 'package:flutter/cupertino.dart';

class LoadingProvider  with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }
}
