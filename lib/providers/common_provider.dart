import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:location_specialist/helpers/models/base/base_media.dart';
import 'package:location_specialist/helpers/models/icon/icon_menu.dart';
import 'package:location_specialist/helpers/models/logo/logo.dart';
import 'package:location_specialist/repository/common/common_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonProvider with ChangeNotifier {
  late SharedPreferences shared;
  bool _startLoading = false;

  bool get startLoading => _startLoading;

  set startLoading(bool startLoading) {
    _startLoading = startLoading;
    notifyListeners();
  }

  bool _initialLoaded = false;
  List<IconMenu> _icons = [];

  List<IconMenu> get icons => _icons;

  set icons(List<IconMenu> icons) {
    _icons = icons;
    notifyListeners();
  }

  Logo? _logo;

  Logo? get logo => _logo;

  set logo(Logo? logo) {
    _logo = logo;
    notifyListeners();
  }

  // write code to catch error if there is not file
  saveLogoImage(Logo logo) async {
    String? pathInApp = shared.getString(logo.pathFromBack);
    try {
      if (pathInApp == null) throw "";
      logo.setLogoFromPath(pathInApp);
    } catch (e) {
      Uint8List temp =
          await CommonRepository().getCommonFile(logo.pathFromBack);
      await logo.setLogo(temp);
      await shared.setString(logo.pathFromBack, logo.pathInApp);
    }
    this._initialLoaded = true;
    this.logo = logo;
    logoStream.sink.add(true);
    await logoStream.sink.close();
    logoStream.close();
    print("IT WAS CLOSEEED");
  }

  saveIconImage(List<IconMenu> icons) async {
    for (int i = 0; i < icons.length; i++) {
      IconMenu item = icons[i];
      String? pathInApp = shared.getString(item.pathFromBack);
      try {
        if (pathInApp == null) throw "";
        item.setImageFromPath(pathInApp);
      } catch (e) {
        Uint8List temp =
            await CommonRepository().getCommonFile(item.pathFromBack);
        await item.setImage(temp);
        await shared.setString(item.pathFromBack, item.pathInApp);
      }
      iconStream.sink.add(item);
    }
    icons.sort((a, b) => a.type.index.compareTo(b.type.index));
    this.icons = icons;
    iconStream.sink.close();
    iconStream.close();
  }

  bool get initialLoaded => _initialLoaded;

  set initialLoaded(bool initialLoaded) {
    _initialLoaded = initialLoaded;
    notifyListeners();
  }

  final StreamController<IconMenu> iconStream = StreamController<IconMenu>();
  final StreamController<bool> logoStream = StreamController<bool>();

  Stream<IconMenu> get iconStreaming => iconStream.stream;

  Future init() async {
    this.startLoading = true;
    try {
      shared = await SharedPreferences.getInstance();
      Map<String, dynamic> response = await CommonRepository().getCommon();
      saveLogoImage(response['logo'] as Logo);
      List<IconMenu> icon = List<IconMenu>.from(response['icon']);
      saveIconImage(icon);
    } catch (e) {
      this.startLoading = false;
    }
  }
}
