import 'package:flutter/cupertino.dart';
import 'package:location_specialist/helpers/interface/abstract_paginator.dart';
import 'package:location_specialist/helpers/models/base/base_provider.dart';
import 'package:location_specialist/helpers/models/category/category.dart';
import 'package:location_specialist/helpers/models/category/category_paginate.dart';

import 'package:location_specialist/repository/category/category_repository.dart';

class CategoryProvider extends BaseProvider implements AbstractPaginator {
  late CategoryPaginate _paginated = new CategoryPaginate();
  late List<Category> _categories = [];
  List<Category> get categories => _categories;
  bool get next => _paginated.next.isEmpty;
  bool get loading => _paginated.loading;
  Future initAsync() async {
    this.paginated = await CategoryRepository().categoryList();
  }

  Future refresh() async {
    this._paginated = await CategoryRepository().categoryList();
    this._categories = this._paginated.list;
    notifyListeners();
  }

  void setLoading() {
    _paginated.setLoading();
    notifyListeners();
  }

  void nextPage() async {
    setLoading();
    this.paginated =
        await CategoryRepository().categoryListPaginate(this._paginated.next);
  }

  set paginated(CategoryPaginate category) {
    _paginated = category;
    categories.addAll(this._paginated.list);
    notifyListeners();
  }
}
