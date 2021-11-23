import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/helpers/widgets/check_box/check-box.dart';
import 'package:location_specialist/helpers/widgets/image_picker/image-picker-custom.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_auth.dart';
import 'package:location_specialist/helpers/widgets/text/text-lang.dart';
import 'package:location_specialist/helpers/widgets/text_field/abstracts/base_text_field.dart';
import 'package:location_specialist/routes/path.dart';

class SpecialistRegister extends StatelessWidget {
  const SpecialistRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldAuth(children: [
      ImagePickerCustom(onSelect: (image) {}),
      BaseTextField(
          hintText: "Описание",
          maxLines: 4,
          validatator: (text) {
            return text!;
          },
          onSaved: (text) {}),
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
      Row(
        children: [
          CheckBoxCustom(
            onPressed: (check) {},
          ),
          StyleHandler.x_margin,
          Flexible(
              child:
                  TextLang("Я согласен с использованием  номера  моей карты"))
        ],
      ),
      BlackButton(
        text: "ЗАРЕГИСТРИРОВАТЬСЯ",
        onPressed: () {
          Get.offAllNamed(Path.MAIN);
        },
      )
    ]);
  }
}
