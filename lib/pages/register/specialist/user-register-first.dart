import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/pages/register/providers/user_provider.dart';
import 'package:location_specialist/pages/register/user/user-register.dart';
import 'package:location_specialist/routes/path.dart';
import 'package:provider/provider.dart';

class UserRegisterFisrt extends UserRegister {
  Widget button() {
    return Builder(builder: (context) {
      return BlackButton(
        text: "Продолжить",
        onPressed: () {
          if (formkey.currentState!.validate()) {
            formkey.currentState!.save();
            final provider = Provider.of<UserProvider>(context, listen: false);
            Get.toNamed(Path.REGISTER_SPECIALIST, arguments: provider.user.toCreate());
          }
        },
      );
    });
  }
}
