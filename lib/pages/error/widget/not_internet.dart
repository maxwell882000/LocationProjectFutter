import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/red-button.dart';
import 'package:location_specialist/helpers/widgets/loading/widgets/loading.dart';
import 'package:location_specialist/helpers/widgets/text/text_title.dart';
import 'package:location_specialist/pages/error/provider/check_provider.dart';
import 'package:provider/provider.dart';

class NotInternet extends StatelessWidget {
  const NotInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<CheckProvider>(
        create: (_) => CheckProvider(),
        child: Loading<CheckProvider>(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextTitle("Отсутствия интернета"),
                StyleHandler.y_margin,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Builder(builder: (context) {
                    return RedButton(
                      text: "Повторить",
                      onPressed: () {
                        Provider.of<CheckProvider>(context, listen: false)
                            .check();
                      },
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
