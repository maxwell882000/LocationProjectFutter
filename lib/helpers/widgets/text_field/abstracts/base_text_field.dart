import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/text_field/helper/sufix-container.dart';

class BaseTextField extends StatelessWidget {
  final String? hintText;
  final Function(String?)? onSaved;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validatator;
  final String? sufixText;
  final bool isPassword;
  final bool autofocus;
  final TextEditingController? controller;
  final String? prefixText;
  final String? initialValue;
  final bool readOnly;
  final FocusNode? focusNode;
  final Icon? icon;
  final Function? onTap;
  final TextInputType? keyboardType;
  final SufixContainer? sufixContainer;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? maxLength;

  const BaseTextField(
      {Key? key,
      this.initialValue,
      this.onChanged,
      this.icon,
      this.prefixText,
      this.maxLength,
      this.keyboardType,
      this.readOnly = false,
      this.maxLines = 1,
      this.onTap,
      this.controller,
      this.autofocus = false,
      this.inputFormatters,
      this.focusNode,
      this.isPassword = false,
      this.sufixContainer,
      this.sufixText,
      this.hintText,
      this.validatator,
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
            controller: controller,
            initialValue: initialValue,
            autofocus: autofocus,
            maxLength: maxLength,
            onTap: () {
              if (onTap != null) onTap!(context, controller);
            },
            inputFormatters: inputFormatters,
            focusNode: this.focusNode,
            cursorColor: Colors.grey.shade500,
            obscureText: isPassword,
            validator: (text) {
              if (validatator == null) {
                return text != null && text != ""
                    ? null
                    : "Поле ${hintText?.tr ?? ''} обязателен".tr;
              }
              return validatator!(text);
            },
            maxLines: maxLines,
            onSaved: onSaved,
            keyboardType: keyboardType,
            readOnly: readOnly,
            onChanged: onChanged,
            decoration: InputDecoration(
                counterText: "",
                icon: icon,
                prefixText: prefixText,
                contentPadding: maxLines! > 1
                    ? EdgeInsets.symmetric(vertical: StyleHandler.padding)
                    : EdgeInsets.zero,
                suffixIcon: sufixContainer,
                suffixIconConstraints: BoxConstraints(maxWidth: 100),
                labelText: hintText?.tr,
                labelStyle: Theme.of(context).textTheme.bodyText1,
                border: InputBorder.none)));
  }
}
