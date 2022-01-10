import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/drop_down/abstracts/custom-dropdown.dart';
import 'package:location_specialist/helpers/widgets/drop_down/abstracts/dropdown-button-style.dart';
import 'package:location_specialist/helpers/widgets/drop_down/abstracts/dropdown-item.dart';
import 'package:location_specialist/helpers/widgets/drop_down/abstracts/dropdown-style.dart';
import 'package:location_specialist/helpers/widgets/text/text-lang.dart';

class PrDropDown extends StatelessWidget {
  final String hintText;
  final Map<int, String> items;
  final Function(int) onChange;
  
  const PrDropDown({Key? key, 
  required this.hintText,
   required this.items,
  required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<Map<int, String>>(
        child: TextLang(
          hintText,
        ),
        onChange: (Map<int, String> value, int index) => onChange(value.entries.first.key),
        dropdownButtonStyle: DropdownButtonStyle(
          width: double.infinity,
          padding: EdgeInsets.all(StyleHandler.padding),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(StyleHandler.borderRadius)),
          primaryColor: StyleHandler.backColor,
        ),
        dropdownStyle: DropdownStyle(
          color: StyleHandler.backColor,
          borderRadius: BorderRadius.circular(8),
          elevation: 6,
        ),
        items: items.entries
            .map(
              (items) => DropdownItem<Map<int, String>>(
                value: {items.key: items.value},
                child: Text(
                  items.value,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            )
            .toList());
  }
}
