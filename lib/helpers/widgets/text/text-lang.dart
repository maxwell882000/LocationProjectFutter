import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextLang extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  const TextLang(this.text, {Key? key, this.textStyle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      this.text.tr,
      textAlign: TextAlign.left,
      style: Theme.of(context)
          .textTheme
          .bodyText1
          ?.merge(textStyle),
    );
  }
}
