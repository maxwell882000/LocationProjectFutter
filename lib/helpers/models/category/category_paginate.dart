import 'package:location_specialist/helpers/models/category/category.dart';
import 'package:location_specialist/helpers/models/paginator/paginator.dart';

class CategoryPaginate extends Paginator<Category> {
  CategoryPaginate() : super();
  CategoryPaginate.fromJson(Map<String, dynamic> map) : super.fromJson(map);
  @override
  List<Category> results(Map<String, dynamic> map) {
    return map['results'].map<Category>((e) => Category.fromJson(e)).toList();
  }
}
