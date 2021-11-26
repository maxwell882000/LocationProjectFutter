import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextTitle extends StatelessWidget {
  final String text;
  const TextTitle(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text.tr,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
