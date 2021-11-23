import 'package:flutter/material.dart';

class DropdownItem<T> extends StatelessWidget {
  final T value;
  final Widget child;

  const DropdownItem({Key? key, required this.value, this.child = const SizedBox()}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return child;
  }
}