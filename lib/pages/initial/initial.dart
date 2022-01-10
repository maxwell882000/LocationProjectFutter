import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/helpers/widgets/drop_down/implementations/pr-dropdown.dart';
import 'package:location_specialist/helpers/widgets/future_widget/future_widget.dart';

import 'package:location_specialist/helpers/widgets/text_field/implementations/text-field-password.dart';
import 'package:location_specialist/providers/auth_provider.dart';
import 'package:location_specialist/providers/common_provider.dart';
import 'package:provider/provider.dart';
import 'package:location_specialist/routes/path.dart';

class Initial extends StatelessWidget {
  const Initial({Key? key}) : super(key: key);
  Future<String> init(context) async {
    var provider = Provider.of<AuthProvider>(context, listen: false);
    var common = Provider.of<CommonProvider>(context, listen: false);
    await provider.init();
    await common.init();
    if (AuthProvider.isAuthorized()) {
      provider.fetchUserData();
      Get.offNamed(Path.MAIN);
    } else {
      Get.offNamed(Path.LOGIN);
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureWidget(
      request: init(context),
      child: SizedBox(),
    ));
  }
}

/* Container(
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
      ), */