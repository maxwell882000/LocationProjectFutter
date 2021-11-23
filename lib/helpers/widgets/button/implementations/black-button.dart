import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/widgets/button/abstracts/base_button.dart';

class BlackButton extends BaseButton {
  BlackButton({Key? key, String text = "", Function? onPressed})
      : super(
            key: key,
            text: text,
            color: Color.fromRGBO(3, 1, 1, 1),
            onPressed: onPressed);
}
