import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/widgets/text_field/abstracts/base_text_field.dart';
import 'package:location_specialist/helpers/widgets/text_field/helper/sufix-container.dart';

class TextFieldPassword extends StatefulWidget {
  final Function(String?)? onSaved;
  final String? hintText;
  final String? initialValue;
  const TextFieldPassword({Key? key, this.onSaved, this.hintText = "Пароль", this.initialValue})
      : super(key: key);
  @override
  _TextFieldPasswordState createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  bool show = true;
  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      onSaved: widget.onSaved,
      validatator: (text) {
        return text != null && text != "" ? null : "Пароль обязателен".tr;
      },
      isPassword: show,
      hintText: widget.hintText,
      sufixContainer: SufixContainer(
        text: !show ? "Скрыть" : "Показать",
        onClick: () {
          setState(() {
            show = !show;
          });
        },
      ),
    );
  }
}
