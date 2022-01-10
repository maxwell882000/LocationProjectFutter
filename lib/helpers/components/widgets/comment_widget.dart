import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/components/providers/comment_provider.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/helpers/widgets/text_field/abstracts/base_text_field.dart';
import 'package:location_specialist/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class CommentWidget extends StatelessWidget {
  CommentWidget({
    Key? key,
  }) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return provider.user == null
              ? Center(child: CircularProgressIndicator())
              : child!;
        },
        child: Column(
          children: [
            Consumer<CommentProvider>(builder: (context, provider, child) {
              return BaseTextField(
                  controller: _controller,
                  maxLines: 3,
                  hintText: "Напишите коментарий",
                  validatator: (text) => text != "" && text != null
                      ? null
                      : "Введите коментарий".tr,
                  onSaved: (text) => provider.sendComment(text!));
            }),
            StyleHandler.y_margin,
            BlackButton(
              text: "Отправить",
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _controller.clear();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
