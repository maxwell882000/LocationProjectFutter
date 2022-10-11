import 'package:flutter/cupertino.dart';
import 'package:location_specialist/pages/register/providers/category_selection_provider.dart';
import 'package:location_specialist/pages/register/widgets/base_selection.dart';

import '../../../helpers/widgets/future_widget/future_provider_custom.dart';

class CategorySelection extends BaseSelection<CategorySelectionProvider> {
  const CategorySelection({
    required Function(List<int> p1) onSelect,
    List<String> Function() category = def,
  }) : super(onSelect: onSelect, name: 'Выберите вид деятельности' ,category: category);

  static List<String> def() {
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return FutureProviderCustom<CategorySelectionProvider>(
        create: CategorySelectionProvider(),
        child: Builder(builder: (context) {
          return super.build(context);
        }));
  }
}
