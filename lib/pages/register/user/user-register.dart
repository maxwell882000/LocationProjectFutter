import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_auth.dart';
import 'package:location_specialist/helpers/widgets/text_field/abstracts/base_text_field.dart';
import 'package:location_specialist/routes/path.dart';

class UserRegister extends StatelessWidget {
  const UserRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldAuth(children: [
      BaseTextField(
          hintText: "Имя",
          validatator: (text) {
            return text!;
          },
          onSaved: (text) {}),
      BaseTextField(
          hintText: "Фамилия",
          validatator: (text) {
            return text!;
          },
          onSaved: (text) {}),
      BaseTextField(
          hintText: "Номер телефона",
          validatator: (text) {
            return text!;
          },
          onSaved: (text) {}),
      BlackButton(
        text: "ЗАРЕГИСТРИРОВАТЬСЯ",
        onPressed: () {
          Get.offAllNamed(Path.MAIN);
        },
      )
    ]);
  }
}
