import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/widgets/future_widget/future_widget.dart';

import 'package:location_specialist/providers/auth_provider.dart';
import 'package:location_specialist/providers/common_provider.dart';
import 'package:location_specialist/repository/auth/auth_repository.dart';
import 'package:location_specialist/services/dynamic_link_service.dart';
import 'package:provider/provider.dart';
import 'package:location_specialist/routes/path.dart';

class Initial extends StatelessWidget {
  const Initial({Key? key}) : super(key: key);

  Future<String> init(context) async {
    print("INITIED");
    var provider = Provider.of<AuthProvider>(context, listen: false);
    var common = Provider.of<CommonProvider>(context, listen: false);
    print(common.startLoading);
    try {
      DynamicLinkService.instance.activateDynamicLink();
      try {
        print("ENETERES INIT");
        await provider.init();
      } catch (e) {}
      print("GETTING COMMON");
      if (!common.startLoading) {
        await common.init();
      }
      if (AuthProvider.isAuthorized()) {
        await AuthRepository().getCheck();
        provider.fetchUserData();
        print("GOO TO MAIN");
        await Get.offNamed(Path.MAIN);
      } else {
        await Get.offNamed(Path.LOGIN);
      }
    } catch (e) {}
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureWidget(
      request: init(context),
      child: Text("INITITED"),
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
