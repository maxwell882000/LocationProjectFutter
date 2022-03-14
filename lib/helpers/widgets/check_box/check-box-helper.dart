import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/check_box/check-box.dart';
import 'package:location_specialist/helpers/widgets/text/text_title.dart';

class CheckBoxHelper extends StatelessWidget {
  final Function(bool) onPressed;
  final String hintText;
  const CheckBoxHelper(
      {Key? key, required this.onPressed, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(child: TextTitle(hintText)),
        StyleHandler.x_margin,
        CheckBoxCustom(onPressed: onPressed)
      ],
    );
  }
}
