import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/text/text-lang.dart';

class TextKeyValue extends StatelessWidget {
  final String keyText;
  final String value;
  const TextKeyValue({Key? key, required this.keyText, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            child: TextLang(
          keyText,
          textStyle: Theme.of(context).textTheme.headline1?.merge(TextStyle(
                fontSize: 15,
              )),
        )),
        StyleHandler.x_margin,
        Flexible(child: Text(value.tr))
      ],
    );
  }
}
