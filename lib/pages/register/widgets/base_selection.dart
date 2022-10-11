import 'package:flutter/material.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';
import 'package:location_specialist/helpers/models/category/category.dart';
import 'package:location_specialist/helpers/widgets/check_box/check-box-drop-down.dart';
import 'package:location_specialist/helpers/widgets/future_widget/future_provider_custom.dart';
import 'package:location_specialist/pages/register/base_providers/base_selection_provider.dart';
import 'package:location_specialist/pages/register/providers/category_selection_provider.dart';
import 'package:provider/provider.dart';

class BaseSelection<T extends BaseSelectionProvider> extends StatelessWidget {
  final List<String> Function() category;
  final Function(List<int>) onSelect;
  final String name;

  const BaseSelection(
      {Key? key,
      required this.onSelect,
      this.category = def,
      required this.name})
      : super(key: key);

  static List<String> def() {
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(builder: (context, provider, child) {
      return CheckBoxDropDown(
        selected: true,
        initialItems: category(),
        items: provider.getNames(),
        onSelect: (value) {
          var ids = provider.getIds(value);
          this.onSelect(ids);
        },
        dropdownTitleTileText: this.name,
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
    });
  }
}
