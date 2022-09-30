import 'package:flutter/material.dart';
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
