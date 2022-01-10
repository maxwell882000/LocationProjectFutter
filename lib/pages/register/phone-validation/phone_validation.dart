import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/red-button.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_auth.dart';
import 'package:location_specialist/helpers/widgets/snackbars/snackbar_handler.dart';
import 'package:location_specialist/pages/register/providers/phone_validation_provider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class PhoneValidation extends StatelessWidget {
  PhoneValidation({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PhoneValidationProvider>(
      create: (_) => PhoneValidationProvider(),
      child: Form(
        key: _formKey,
        child: ScaffoldAuth<PhoneValidationProvider>(
          children: [
            Text("Подтверждение по СМС",
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center),
            Builder(builder: (context) {
              return PinCodeTextField(
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  borderWidth: 1,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  activeColor: Colors.grey,
                  inactiveColor: Colors.grey,
                  disabledColor: Colors.grey,
                  selectedColor: Colors.grey,
                  activeFillColor: Colors.white,
                ),
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                validator: (text) {
                  if (text == null || text == "") {
                    SnackbarHandler.error(
                        title: "Ошибка".tr, body: "Введите код".tr);
                    return "";
                  }
                  return null;
                },
                onSaved: (v) {
                  var provider = Provider.of<PhoneValidationProvider>(context,
                      listen: false);
                  provider.code = v!;
                },
                onChanged: (value) {},
                appContext: context,
              );
            }),
            Text(
                'Убедитесь, что функция СМС-уведомления активирована, В случае проблем с получением СМС, обратитесь в ваш банк.'
                    .tr,
                textAlign: TextAlign.center),
            Builder(builder: (context) {
              return BlackButton(
                text: "Подтвердить",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final provider = Provider.of<PhoneValidationProvider>(
                        context,
                        listen: false);
                    provider.confirmCode();
                  }
                },
              );
            }),
            Builder(builder: (context) {
              return TextButton(
                onPressed: () {
                  final provider = Provider.of<PhoneValidationProvider>(context,
                      listen: false);
                  provider.startSendCode();
                },
                child: Text("Переотправить код"),
              );
            }),
          ],
        ),
      ),
    );
  }
}
