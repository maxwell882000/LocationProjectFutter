import 'package:flutter/cupertino.dart';
import 'package:location_specialist/pages/register/widgets/base_selection.dart';

import '../../../helpers/widgets/future_widget/future_provider_custom.dart';
import '../providers/client_category_selection_provider.dart';

class CategoryClientSelection
    extends BaseSelection<ClientCategorySelectionProvider> {
  const CategoryClientSelection({
    required Function(List<int> p1) onSelect,
    List<String> Function() category = def,
  }) : super(
            onSelect: onSelect,
            name: 'Выберите категории клиентов',
            category: category);

  static List<String> def() {
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return FutureProviderCustom<ClientCategorySelectionProvider>(
        create: ClientCategorySelectionProvider(), child: super.build(context));
  }
}
