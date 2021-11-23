import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/helpers/widgets/drop_down/implementations/pr-dropdown.dart';

import 'package:location_specialist/helpers/widgets/text_field/implementations/text-field-password.dart';

class Initial extends StatelessWidget {
  const Initial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFieldPassword(),
            PrDropDown(
              hintText: 'Выберите',
              items: {
                1: "First",
                2: "Second",
              },
            ),
            BlackButton(
              text: "Зарегистрироваться",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
