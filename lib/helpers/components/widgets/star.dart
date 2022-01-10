import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/components/providers/start_provider.dart';
import 'package:provider/provider.dart';

class Star extends StatelessWidget {
  final int mark;
  const Star({Key? key, required this.mark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Consumer<StarProvider>(builder: (context, provider, child) {
        return GestureDetector(
          onTap: () {
            provider.selected = mark;
          },
          child: Container(
            height: 50,
            width: 50,
            child: Image.asset(provider.getStatus(mark)),
          ),
        );
      }),
    );
  }
}
