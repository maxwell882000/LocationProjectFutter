import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/custom_action/custom-action.dart';
import 'package:location_specialist/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class ScaffoldInside extends StatelessWidget {
  final Widget body;
  final Widget? bottomSheet;

  const ScaffoldInside({Key? key, required this.body, this.bottomSheet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return Scaffold(
              bottomSheet: bottomSheet,
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                title: Text(
                    provider.user?.isProAccount == true ? "Про аккаунт" : ""),
                actions: [CustomAction()],
              ),
              body: child);
        },
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: StyleHandler.padding * 2,
              vertical: StyleHandler.padding),
          child: this.body,
        ));
  }
}
