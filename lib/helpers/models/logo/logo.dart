import 'dart:io';
import 'dart:typed_data';

import 'package:location_specialist/helpers/models/base/base_media.dart';
import 'package:location_specialist/helpers/models/base/base_model.dart';

class Logo extends BaseMedia {
  late File logo;

  Future setLogo(Uint8List list) async {
    logo = await this.setMedia(list);
  }

  setLogoFromPath(String path) {
    this.pathInApp = path;
    this.logo = File(path);
    if(!this.logo.existsSync()) {
      throw "Logo not exists";
    }
  }

  Logo.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    pathFromBack = map['logo'];
  }

  @override
  String getPath() {
    return "/logo/logo";
  }
}
