import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/helpers/widgets/text_field/abstracts/base_text_field.dart';

class CommentForm extends StatelessWidget {
  final Function(String?) onSaved;
  final String Function(String?) validatator;
  final Function sendComment;
  const CommentForm({
    Key? key,
    required this.onSaved,
    required this.validatator,
    required this.sendComment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BaseTextField(
            maxLines: 3,
            hintText: "Напишите коментарий",
            validatator: (text) => validatator(text),
            onSaved: (text) => onSaved(text)),
        StyleHandler.y_margin,
        BlackButton(
          text: "Отправить",
          onPressed: sendComment,
        )
      ],
    );
  }
}
