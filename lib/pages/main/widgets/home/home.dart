import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/models/scroll_physics/always_scroll_one_top.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/helpers/widgets/text_field/stack/search_text_field.dart';
import 'package:location_specialist/pages/main/widgets/home/search.dart';
import 'package:location_specialist/routes/path.dart';
import 'adds.dart';
import 'main_map.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: Get.height -
            Scaffold.of(context).appBarMaxHeight! -
            kBottomNavigationBarHeight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StyleHandler.y_margin,
            SingleChildScrollView(
                physics: AlwaysScrollOneTop(), child: Adds()),
            StyleHandler.y_margin,
            BlackButton(
              text: "Поиск",
              onPressed: () {
                Get.toNamed(Path.SEARCH);
              },
            ),
            StyleHandler.y_margin,
            Expanded(child: MainMap()),
            StyleHandler.y_margin,
          ],
        ),
      );
    });
  }
}
