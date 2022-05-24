import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/red-button.dart';
import 'package:location_specialist/helpers/widgets/image_picker/image-picker-custom.dart';
import 'package:location_specialist/helpers/widgets/loading/providers/loading_provider.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_auth.dart';
import 'package:location_specialist/helpers/widgets/text/text-logo.dart';
import 'package:location_specialist/helpers/widgets/text_field/abstracts/base_text_field.dart';
import 'package:location_specialist/helpers/widgets/text_field/implementations/text-field-password.dart';
import 'package:location_specialist/helpers/widgets/text_field/implementations/text-field-phone.dart';
import 'package:location_specialist/pages/login/providers/login_provider.dart';
import 'package:location_specialist/providers/auth_provider.dart';
import 'package:location_specialist/providers/common_provider.dart';
import 'package:location_specialist/routes/path.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formState,
      child: ChangeNotifierProvider<LoginProvider>(
        create: (_) {
          return LoginProvider();
        },
        child: ScaffoldAuth<LoginProvider>(
          children: [
            Consumer<LoginProvider>(builder: (context, provider, child) {
              return TextFieldPhone(onSaved: (text) {
                provider.auth.phone = text!;
              });
            }),
            Consumer<LoginProvider>(builder: (context, provider, child) {
              return TextFieldPassword(
                onSaved: (text) {
                  provider.auth.password = text!;
                },
              );
            }),
            Builder(builder: (context) {
              return RedButton(
                text: "ВОЙТИ",
                onPressed: () {
                  if (_formState.currentState!.validate()) {
                    _formState.currentState!.save();
                    final provider =
                        Provider.of<LoginProvider>(context, listen: false);
                    provider.sendAuthorization(context);
                  }
                },
              );
            }),
            BlackButton(
              text: "РЕГИСТРАЦИЯ",
              onPressed: () {
                Get.toNamed(Path.REGISTER_CHOOSE);
              },
            ),
            StyleHandler.y_margin,
            TextButton(
                onPressed: () {
                  Get.toNamed(Path.FORGET_PHONE);
                },
                child: Text("Забыли пароль ?"))
          ],
        ),
      ),
    );
  }
}
