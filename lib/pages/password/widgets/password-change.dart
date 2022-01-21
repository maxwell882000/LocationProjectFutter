import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/helpers/widgets/loading/widgets/loading.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_inside.dart';
import 'package:location_specialist/helpers/widgets/text/text_title.dart';
import 'package:location_specialist/helpers/widgets/text_field/implementations/text-field-password.dart';
import 'package:location_specialist/pages/password/provider/password_change_provider.dart';
import 'package:provider/provider.dart';

class PasswordChange extends StatelessWidget {
  PasswordChange({Key? key}) : super(key: key);
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ScaffoldInside(
      body: ChangeNotifierProvider<PasswordChangeProvider>(
        create: (_) => PasswordChangeProvider(),
        child: Loading<PasswordChangeProvider>(
            child: Form(
                key: _key,
                child: Builder(builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      StyleHandler.y_margin,
                      TextTitle("Изменить пароль"),
                      StyleHandler.y_margin,
                      Flexible(
                          child: ListView(
                        children: [
                          TextFieldPassword(
                            onSaved: (text) =>
                                Provider.of<PasswordChangeProvider>(context,listen: false)
                                    .password = text!,
                          ),
                          StyleHandler.y_margin,
                          TextFieldPassword(
                            onSaved: (text) =>
                                Provider.of<PasswordChangeProvider>(context,listen: false)
                                    .newPassword = text!,
                            hintText: "Новый пароль",
                          ),
                          StyleHandler.y_margin,
                          TextFieldPassword(
                            onSaved: (text) =>
                                Provider.of<PasswordChangeProvider>(context,listen: false)
                                    .repeatPassword= text!,
                            hintText: "Подтвердите пароль",
                          ),
                          StyleHandler.y_margin,
                        ],
                      )),
                      StyleHandler.y_margin,
                      BlackButton(
                        text: "Добавить",
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            _key.currentState!.save();
                            Provider.of<PasswordChangeProvider>(context,
                                    listen: false)
                                .changePassword();
                          }
                        },
                      ),
                    ],
                  );
                }))),
      ),
    );
  }
}
