import 'package:flutter/cupertino.dart';
import 'package:location_specialist/helpers/models/base/base_provider.dart';
import 'package:location_specialist/helpers/models/category/category.dart';
import 'package:location_specialist/repository/category/category_repository.dart';

class CategorySelectionProvider extends BaseProvider {
  List<Category> _category = [];

  List<Category> get category => _category;

  CategorySelectionProvider() {
  }
  set category(List<Category> category) {
    _category = category;
    notifyListeners();
  }

  @override
  initAsync() async {
    this.category = await CategoryRepository().categorySelectList();
  }
}
