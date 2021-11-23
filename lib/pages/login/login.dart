import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/red-button.dart';
import 'package:location_specialist/helpers/widgets/image_picker/image-picker-custom.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_auth.dart';
import 'package:location_specialist/helpers/widgets/text/text-logo.dart';
import 'package:location_specialist/helpers/widgets/text_field/abstracts/base_text_field.dart';
import 'package:location_specialist/helpers/widgets/text_field/implementations/text-field-password.dart';
import 'package:location_specialist/routes/path.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldAuth(
      children: [
        BaseTextField(
            hintText: "Телефон",
            validatator: (text) {
              return text!;
            },
            onSaved: (text) {}),
        TextFieldPassword(),
        RedButton(
          text: "ВОЙТИ",
          onPressed: () {
            Get.offNamed(Path.MAIN);
          },
        ),
        BlackButton(
          text: "РЕГИСТРАЦИЯ",
          onPressed: () {
            Get.toNamed(Path.REGISTER_CHOOSE);
          },
        ),
      ],
    );
  }
}
