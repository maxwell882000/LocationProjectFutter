import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';

import 'package:location_specialist/helpers/widgets/text_field/stack/search_text_field.dart';
import 'package:location_specialist/pages/main/providers/search_provider.dart';
import 'package:location_specialist/routes/path.dart';
import 'package:provider/provider.dart';

class SearchMap extends StatelessWidget {
  const SearchMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(StyleHandler.padding * 2),
          child: Hero(
            tag: "search",
            child: ChangeNotifierProvider<SearchProvider>(
              create: (_) => new SearchProvider(),
              child: ListView(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Consumer<SearchProvider>(
                          builder: (context, provider, child) =>
                              SearchTextField(
                            autofocus: true,
                            controller: provider.controller,
                            textListener: () => provider.listnerText(),
                            onFocusChange: (val) {
                              if (val) {}
                            },
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.cancel))
                    ],
                  ),
                  Consumer<SearchProvider>(
                      builder: (context, provider, child) => Column(
                          children: provider.location
                              .map<Widget>((e) => ListTile(
                                    onTap: () {
                                      Get.offAndToNamed(Path.LOCATION_PROFILE,
                                          arguments: e);
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
