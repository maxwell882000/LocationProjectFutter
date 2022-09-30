import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/widgets/map/widget/base_search_map_widget.dart';

import 'package:location_specialist/pages/main/providers/search_provider.dart';
import 'package:location_specialist/routes/path.dart';

class SearchMap extends BaseSearchMapWidget<SearchProvider> {
  const SearchMap({Key? key}) : super(key: key, create: getProvider);
  onTapSearch(e) {
    Get.offAndToNamed(Path.LOCATION_PROFILE, arguments: e);
  }
  static SearchProvider getProvider(context) {
    return new SearchProvider();
  }
/* 
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
                            Get.back();
                          },
                          icon: Icon(Icons.cancel))
                    ],
                  ),
                  Consumer<SearchProvider>(
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
  } */
}
