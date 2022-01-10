import 'package:location_specialist/helpers/widgets/text_field/abstracts/base_text_field.dart';

class TextFieldPhone extends BaseTextField {
  TextFieldPhone({required Function(String?)? onSaved, String? initialValue})
      : super(
          onSaved: onSaved,
          hintText: "Телефон",
          initialValue: initialValue,
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
