import 'package:location_specialist/pages/register/base_providers/base_selection_provider.dart';
import 'package:location_specialist/repository/category/category_repository.dart';

import '../../../helpers/models/category/client_category.dart';

class ClientCategorySelectionProvider
    extends BaseSelectionProvider<ClientCategory> {
  @override
  initAsync() async {
    this.selection = await CategoryRepository().categoryClientSelectList();
  }

  @override
  List<String> getNames() {
    return this.selection.map<String>((e) => e.name).toList();
  }
}
