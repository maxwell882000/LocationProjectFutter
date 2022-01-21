import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_auth.dart';
import 'package:location_specialist/helpers/widgets/text_field/abstracts/base_text_field.dart';
import 'package:location_specialist/helpers/widgets/text_field/implementations/text-field-password.dart';
import 'package:location_specialist/helpers/widgets/text_field/implementations/text-field-phone.dart';
import 'package:location_specialist/pages/register/providers/user_provider.dart';
import 'package:location_specialist/routes/path.dart';
import 'package:provider/provider.dart';

class UserRegister extends StatelessWidget {
  UserRegister({Key? key}) : super(key: key);
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Widget button() {
    return Builder(builder: (context) {
      return BlackButton(
        text: "ЗАРЕГИСТРИРОВАТЬСЯ",
        onPressed: () {
          if (formkey.currentState!.validate()) {
            formkey.currentState!.save();
            final provider = Provider.of<UserProvider>(context, listen: false);
            provider.registerUser();
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
      create: (_) => UserProvider(),
      child: Form(
        key: formkey,
        child: ScaffoldAuth<UserProvider>(children: [
          Consumer<UserProvider>(builder: (context, provider, child) {
            return BaseTextField(
                hintText: "Имя",
                initialValue: provider.user.firstname,
                validatator: (text) {
                  return text != null || text == ""
                      ? null
                      : "Имя обязательное поле";
                },
                onSaved: (text) {
                  provider.name = text!;
                });
          }),
          Consumer<UserProvider>(builder: (context, provider, child) {
            return BaseTextField(
                hintText: "Фамилия",
                initialValue: provider.user.lastname,
                validatator: (text) {
                  return text != null || text == ""
                      ? null
                      : "Фамилия обязательное поле";
                },
                onSaved: (text) {
                  provider.lastname = text!;
                });
          }),
          Consumer<UserProvider>(builder: (context, provider, child) {
            return TextFieldPhone(
                initialValue: provider.user.phone,
                onSaved: (text) {
                  provider.phone = text!;
                });
          }),
          Consumer<UserProvider>(builder: (context, provider, child) {
            return TextFieldPassword(
                initialValue: provider.user.password,
                onSaved: (text) {
                  provider.password = text!;
                });
          }),
          button()
        ]),
      ),
    );
  }
}
