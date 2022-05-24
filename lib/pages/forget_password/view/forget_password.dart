import 'package:flutter/cupertino.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_auth.dart';
import 'package:location_specialist/helpers/widgets/text_field/implementations/text-field-password.dart';
import 'package:location_specialist/pages/forget_password/providers/forget_password_provider.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formState,
        child: ChangeNotifierProvider<ForgetPasswordProvider>(
          create: (_) => ForgetPasswordProvider(),
          child: Builder(builder: (context) {
            return ScaffoldAuth<ForgetPasswordProvider>(
              children: [
                TextFieldPassword(
                  onSaved: (text) {
                    Provider.of<ForgetPasswordProvider>(context, listen: false)
                        .password = text!;
                  },
                ),
                TextFieldPassword(
                  hintText: "Повторите пароль",
                  onSaved: (text) {
                    Provider.of<ForgetPasswordProvider>(context, listen: false)
                        .repPassword = text!;
                  },
                ),
                BlackButton(
                  text: "Добавить",
                  onPressed: () {
                    if (_formState.currentState!.validate()) {
                      _formState.currentState!.save();
                      Provider.of<ForgetPasswordProvider>(context,
                              listen: false)
                          .changePassword();
                    }
                  },
                ),
              ],
            );
          }),
        ));
  }
}
