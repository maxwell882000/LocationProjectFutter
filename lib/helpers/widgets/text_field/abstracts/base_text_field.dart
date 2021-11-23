import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/text_field/helper/sufix-container.dart';

class BaseTextField extends StatelessWidget {
  final String? hintText;
  final Function(String?)? onSaved;
  final String Function(String?)? validatator;
  final String? sufixText;
  final bool isPassword;
  final SufixContainer? sufixContainer;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  const BaseTextField(
      {Key? key,
      this.maxLines = 1,
      this.inputFormatters,
      this.isPassword = false,
      this.sufixContainer,
      this.sufixText,
      this.hintText,
      required this.validatator,
      required this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: StyleHandler.padding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(StyleHandler.borderRadius),
            color: StyleHandler.backColor),
        child: TextFormField(
            inputFormatters: inputFormatters,
            cursorColor: Colors.grey.shade500,
            obscureText: isPassword,
            validator: validatator,
            maxLines: maxLines,
            onSaved: onSaved,
            decoration: InputDecoration(
                contentPadding: maxLines! > 1
                    ? EdgeInsets.symmetric(vertical: StyleHandler.padding)
                    : EdgeInsets.zero,
                suffixIcon: sufixContainer,
                suffixIconConstraints: BoxConstraints(maxWidth: 100),
                hintText: hintText!.tr,
                hintStyle: Theme.of(context).textTheme.bodyText1,
                border: InputBorder.none)));
  }
}
