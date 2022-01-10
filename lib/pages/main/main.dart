import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/custom_action/custom-action.dart';
import 'package:location_specialist/helpers/widgets/future_widget/future_widget.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_main.dart';
import 'package:location_specialist/pages/main/providers/main_provider.dart';
import 'package:provider/provider.dart';

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldMain(
      body: Consumer<MainPorivder>(
        builder: (context, provider, child) => provider.loaded
            ? Center(
                child: CircularProgressIndicator(),
              )
            : PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: provider.controller,
                children: provider.children,
              ),
      ),
    );
  }
}
