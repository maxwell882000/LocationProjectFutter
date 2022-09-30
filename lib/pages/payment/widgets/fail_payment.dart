import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_inside.dart';

class FailPayment extends StatelessWidget {
  const FailPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldInside(
        body: Center(
            child: Text(
      "Произошла ошибка при платеже!!!",
      style: Get.textTheme.headline1?.merge(TextStyle(color: Colors.red)),
    )));
  }
}
