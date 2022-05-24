import 'package:flutter/cupertino.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_auth.dart';
import 'package:location_specialist/helpers/widgets/text_field/abstracts/base_text_field.dart';
import 'package:location_specialist/helpers/widgets/text_field/implementations/text-field-phone.dart';
import 'package:location_specialist/pages/forget_password/providers/forget_phone_provider.dart';
import 'package:provider/provider.dart';

import '../../../helpers/widgets/button/implementations/black-button.dart';

class ForgetPhone extends StatelessWidget {
  ForgetPhone({Key? key}) : super(key: key);
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _key,
        child: ChangeNotifierProvider<ForgetPhoneProvider>(
          create: (BuildContext context) => ForgetPhoneProvider(),
          child: Builder(builder: (context) {
            return ScaffoldAuth<ForgetPhoneProvider>(
              children: [
                TextFieldPhone(onSaved: (text) {
                  Provider.of<ForgetPhoneProvider>(context, listen: false)
                      .phone = text!;
                }),
                BlackButton(
                  text: "Востановить",
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      _key.currentState!.save();
                      Provider.of<ForgetPhoneProvider>(context, listen: false)
                          .validatePhone();
                    }
                  },
                ),
              ],
            );
          }),
        ));
  }
}
