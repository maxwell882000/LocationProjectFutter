import 'dart:io';
import 'dart:typed_data';

import 'package:location_specialist/helpers/models/base/base_media.dart';
import 'package:location_specialist/helpers/models/base/base_model.dart';

class IconMenu extends BaseMedia {
  late File image;
  late TypeMenuIcon type;
  IconMenu.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    pathFromBack = map['icon'];
    type = TypeMenuIcon.values[map['type']];
  }
  Future setImage(Uint8List list) async {
    image = await setMedia(list);
  }

  setImageFromPath(String path) {
    this.pathInApp = path;
    this.image = File(pathInApp);
    if(!this.image.existsSync()){
       throw "Not exists file in Icon menu";
    }
  }

  @override
  String getPath() {
    return "/icon/" + type.name;
  }
}

enum TypeMenuIcon { MENU, CATEGORIES, SPECIALIST, PERSONAL }
