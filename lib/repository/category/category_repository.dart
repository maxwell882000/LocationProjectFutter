import 'package:location_specialist/helpers/models/category/category.dart';
import 'package:location_specialist/helpers/models/category/category_paginate.dart';
import 'package:location_specialist/repository/mixin/api_base_methods.dart';
import 'package:location_specialist/repository/model/request.dart';

class CategoryRepository with ApiBaseMethods {
  static final CategoryRepository _singleton = CategoryRepository._internal();
  factory CategoryRepository() {
    return _singleton;
  }

  CategoryRepository._internal();

  static const String prefix = "specialist/category/";

  Future<CategoryPaginate> categoryList() async {
    Map<String, dynamic> response =
        await this.get(new Request(prefix + "list/"));
    return CategoryPaginate.fromJson(response);
  }

  Future<List<Category>> categorySelectList() async {
    var response = await this.get(new Request(prefix + "list/select/?size=0"));
    return response['results'].map<Category>((e) => Category.select(e)).toList();
  }

  Future<CategoryPaginate> categoryListPaginate(String url) async {
    Map<String, dynamic> response = await this.getPaginate(new Request(url));
    return CategoryPaginate.fromJson(response);
  }
}
