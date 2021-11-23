import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/custom_action/custom-action.dart';
import 'package:location_specialist/pages/main/providers/main_provider.dart';
import 'package:provider/provider.dart';

class ScaffoldMain extends StatelessWidget {
  final Widget body;
  const ScaffoldMain({Key? key ,required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainPorivder>(
      create: (_) => new MainPorivder(),
      child: Scaffold(
        appBar: AppBar(
          leading: Center(
              child: Text(
            "ABС",
            style: TextStyle(fontSize: 20),
          )),
          actions: [CustomAction()],
        ),
        body: Container(
        margin: EdgeInsets.symmetric(horizontal: StyleHandler.padding * 2),
        child: this.body
        ),
        bottomNavigationBar: Consumer<MainPorivder>(
          builder: (context, provider, child)=> BottomNavigationBar(
              showSelectedLabels: false,
              onTap: provider.currentPage,
              showUnselectedLabels: false,
              items: provider.footer
                  .map<BottomNavigationBarItem>((e) => BottomNavigationBarItem(
                      icon: SizedBox(
                          height: 25, width: 25, child: Image.asset(e.path)),
                      label: ""))
                  .toList()),
        ),
      ),
    );
  }
}
