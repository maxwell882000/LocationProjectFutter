import 'package:flutter/cupertino.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class MultiSelectCustom<T> extends MultiSelectDialog<T> {
  final List<MultiSelectItem<T>> Function(MultiSelectCustom object, String? val,
      List<MultiSelectItem<T>> allItems)? onSearchStarted;

  MultiSelectCustom({
    required final List<MultiSelectItem<T>> items,
    required final List<T> initialValue,
    final Widget? title,
    final void Function(List<T>)? onSelectionChanged,
    final void Function(List<T>)? onConfirm,
    required final bool searchable,
    final Text? confirmText,
    final Text? cancelText,
    this.onSearchStarted,
    final MultiSelectListType? listType,
    final Color? selectedColor,
    final double? height,
    final double? width,
    final String? searchHint,
    final Color? Function(T)? colorator,
    final Color? backgroundColor,
    final Color? unselectedColor,
    final Icon? searchIcon,
    final Icon? closeSearchIcon,
    final TextStyle? itemsTextStyle,
    final TextStyle? selectedItemsTextStyle,
    final TextStyle? searchTextStyle,
    final TextStyle? searchHintStyle,
    required final bool separateSelectedItems,
    final Color? checkColor,
  }) : super(
            items: items,
            initialValue: initialValue,
            title: title,
            onSelectionChanged: onSelectionChanged,
            onConfirm: onConfirm,
            searchable: searchable,
            confirmText: confirmText,
            cancelText: cancelText,
            listType: listType,
            selectedColor: selectedColor,
            height: height,
            width: width,
            searchHint: searchHint,
            colorator: colorator,
            backgroundColor: backgroundColor,
            unselectedColor: unselectedColor,
            searchIcon: searchIcon,
            closeSearchIcon: closeSearchIcon,
            itemsTextStyle: itemsTextStyle,
            selectedItemsTextStyle: selectedItemsTextStyle,
            searchTextStyle: searchTextStyle,
            searchHintStyle: searchHintStyle,
            separateSelectedItems: separateSelectedItems,
            checkColor: checkColor);

  @override
  List<MultiSelectItem<T>> updateSearchQuery(
      String? val, List<MultiSelectItem<T>> allItems) {
    if (onSearchStarted != null)
      return onSearchStarted!(this, val, allItems);
    else
      return super.updateSearchQuery(val, allItems);
  }
}
