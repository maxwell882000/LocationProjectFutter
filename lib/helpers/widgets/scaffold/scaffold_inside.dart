import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/custom_action/custom-action.dart';

class ScaffoldInside extends StatelessWidget {
  final Widget body;
  const ScaffoldInside({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [CustomAction()],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: StyleHandler.padding * 2,
            vertical: StyleHandler.padding),
        child: this.body,
      ),
    );
  }
}
