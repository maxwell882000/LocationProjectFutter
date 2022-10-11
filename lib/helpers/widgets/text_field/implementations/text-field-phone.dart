import 'package:flutter/services.dart';
import 'package:location_specialist/helpers/widgets/text_field/abstracts/base_text_field.dart';

class TextFieldPhone extends BaseTextField {
  TextFieldPhone({required Function(String?)? onSaved, String? initialValue})
      : super(
          onSaved: (text) => onSaved!("+7" + text!),
          hintText: "Телефон",
          initialValue: initialValue?.replaceAll("+7", ""),
          prefixText: "+7",
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          validatator: (text) {
            RegExp regExp = new RegExp(r"^(\+\d*|\d*)$");
            return text == null || text == ""
                ? "Номер телефона обязателен"
                : regExp.hasMatch(text)
                    ? null
                    : "Ваш номер не подходит";
          },
        );
}
