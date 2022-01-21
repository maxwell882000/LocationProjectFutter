import 'package:flutter/material.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';
import 'package:location_specialist/helpers/models/category/category.dart';
import 'package:location_specialist/helpers/widgets/check_box/check-box-drop-down.dart';
import 'package:location_specialist/helpers/widgets/future_widget/future_provider_custom.dart';
import 'package:location_specialist/helpers/widgets/future_widget/future_widget.dart';
import 'package:location_specialist/pages/register/providers/category_selection_provider.dart';
import 'package:provider/provider.dart';

class CategorySelection extends StatelessWidget {
  final List<Category> category;
  final Function(List<int>) onSelect;
  const CategorySelection(
      {Key? key, required this.onSelect, this.category = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(category);
    return FutureProviderCustom<CategorySelectionProvider>(
      create: CategorySelectionProvider(),
      child: Consumer<CategorySelectionProvider>(
          builder: (context, provider, child) {
        return CheckBoxDropDown(
          selected: true,
          initialItems:
              this.category.map<String>((e) => e.categoryName).toList(),
          items: provider.category.map<String>((e) => e.categoryName).toList(),
          onSelect: (value) {
            var ids = value.map<int>((e) => provider.category[e].id).toList();
            this.onSelect(ids);
          },
          dropdownTitleTileText: 'Выберите вид деятельности',
          dropdownTitleTileColor: Colors.white,
          dropdownTitleTileMargin:
              EdgeInsets.only(top: 22, left: 18, right: 18, bottom: 5),
          dropdownTitleTilePadding: EdgeInsets.all(10),
          dropdownUnderlineBorder:
              const BorderSide(color: Colors.transparent, width: 2),
          dropdownTitleTileBorder: Border.all(color: Colors.grey, width: 1),
          dropdownTitleTileBorderRadius: BorderRadius.circular(5),
          expandedIcon: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black54,
          ),
          collapsedIcon: const Icon(
            Icons.keyboard_arrow_up,
            color: Colors.black54,
          ),
          dropdownTitleTileTextStyle:
              const TextStyle(fontSize: 14, color: Colors.black54),
          padding: const EdgeInsets.all(6),
          margin: const EdgeInsets.all(6),
          type: GFCheckboxType.square,
          activeBorderColor: Colors.grey,
          inactiveBorderColor: Colors.grey,
        );
      }),
    );
  }
}
