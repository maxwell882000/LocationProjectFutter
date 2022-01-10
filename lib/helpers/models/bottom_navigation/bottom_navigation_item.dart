import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';

class BottomNavigationItem {
  final File file;
  final Widget body;
  const BottomNavigationItem(this.file, this.body);
}
