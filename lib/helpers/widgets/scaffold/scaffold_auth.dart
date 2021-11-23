import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/text/text-logo.dart';

class ScaffoldAuth extends StatelessWidget {
  final List<Widget> children;
  const ScaffoldAuth({Key? key, required this.children}) : super(key: key);
  List<Widget> insertMargin() {
    List<Widget> chldrnMrgn = [];
    children.forEach((element) {
      chldrnMrgn.add(StyleHandler.y_margin);
      chldrnMrgn.add(element);
    });
    return chldrnMrgn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: SizedBox(
            height: Get.height,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextLogo(),
                    StyleHandler.y_margin,
                    ...insertMargin()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
