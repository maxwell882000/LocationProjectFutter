import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'adds.dart';
import 'main_map.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Adds(),
        StyleHandler.y_margin,
        Flexible(child: MainMap()),
      ],
    );
  }
}
