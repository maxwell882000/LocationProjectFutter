import 'package:location_specialist/helpers/models/base/base_provider.dart';
import 'package:location_specialist/helpers/models/category/category.dart';
import 'package:location_specialist/pages/register/base_providers/base_selection_provider.dart';
import 'package:location_specialist/repository/category/category_repository.dart';

class CategorySelectionProvider extends BaseSelectionProvider<Category> {
  @override
  initAsync() async {
    this.selection = await CategoryRepository().categorySelectList();
  }

  @override
  List<String> getNames() {
    return this.selection.map<String>((e) => e.categoryName).toList();
  }
}
