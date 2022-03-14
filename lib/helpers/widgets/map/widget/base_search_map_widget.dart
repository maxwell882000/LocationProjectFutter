import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/widgets/map/provider/base_search_provider.dart';
import 'package:location_specialist/helpers/widgets/text_field/stack/search_text_field.dart';
import 'package:provider/provider.dart';

import '../../../../pages/main/providers/search_provider.dart';
import '../../../static/style_handler.dart';

abstract class BaseSearchMapWidget<T extends BaseSearchProvider>
    extends StatelessWidget {
  final T Function(BuildContext) create;
  const BaseSearchMapWidget({Key? key, required this.create}) : super(key: key);
  onTapSearch(e);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(StyleHandler.padding * 2),
          child: Hero(
            tag: "search",
            child: ChangeNotifierProvider<T>(
              create: create,
              child: ListView(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Consumer<T>(
                          builder: (context, provider, child) =>
                              SearchTextField(
                            autofocus: true,
                            controller: provider.controller,
                            hintText: provider.hintText(),
                            textListener: () => provider.listnerText(),
                            onFocusChange: (val) {
                              if (val) {}
                            },
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.cancel))
                    ],
                  ),
                  Consumer<T>(
                      builder: (context, provider, child) => Column(
                          children: provider.location
                              .map<Widget>((e) => ListTile(
                                    onTap: () {
                                      provider.disposed = true;
                                      onTapSearch(e);
                                    },
                                    title: Text(e.name),
                                  ))
                              .toList())),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
