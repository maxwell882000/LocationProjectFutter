import 'package:flutter/cupertino.dart';
import 'package:location_specialist/helpers/models/category/category.dart';
import 'package:location_specialist/helpers/models/specialist/specialist.dart';

class CategoryProvider with ChangeNotifier {
  late List<Category> categories;
}
