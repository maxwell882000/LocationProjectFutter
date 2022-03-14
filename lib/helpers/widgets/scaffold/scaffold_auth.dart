import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/loading/providers/loading_provider.dart';
import 'package:location_specialist/helpers/widgets/loading/widgets/loading.dart';
import 'package:location_specialist/helpers/widgets/logo/logo_widget.dart';
import 'package:location_specialist/helpers/widgets/text/text-logo.dart';

class ScaffoldAuth<T extends LoadingProvider> extends StatelessWidget {
  final List<Widget> children;
  final AppBar? appBar;
  const ScaffoldAuth({Key? key, required this.children, this.appBar}) : super(key: key);
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
      appBar: appBar,
      body: SafeArea(
        child: Loading<T>(
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
                      LogoWidget(),
                      StyleHandler.y_margin,
                      ...insertMargin()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
