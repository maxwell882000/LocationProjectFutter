import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/red-button.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_auth.dart';
import 'package:location_specialist/routes/path.dart';

class ChoiceRegistration extends StatelessWidget {
  const ChoiceRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldAuth(
      children: [
        RedButton(
          text: "Специалист",
          onPressed: () {
            Get.toNamed(Path.REGISTER_SPECIALIST);
          },
        ),
        BlackButton(
          text: "Пользователь",
            onPressed: () {
            Get.toNamed(Path.REGISTER_USER);
          },
        ),
      ],
    );
  }
}
