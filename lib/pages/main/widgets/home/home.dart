import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Column(
      children: [
        StyleHandler.y_margin,
        Adds(),
        StyleHandler.y_margin,
        BlackButton(
          text: "Поиск",
          onPressed: () {
            Get.toNamed(Path.SEARCH);
          },
        ),
        /*       Hero(
          tag: 'search',
          child: SearchTextField(
            hintText: "Поиск по карте",
            onFocusChange: (val) {
              if (val) {
                /*            Get.toNamed(Path.SEARCH, preventDuplicates: true); */
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 100),
                        pageBuilder: (_, __, ___) => SearchMap()));
              }
            },
          ),
        ), */
        StyleHandler.y_margin,
        Flexible(child: MainMap()),
        StyleHandler.y_margin,
      ],
    );
  }
}
