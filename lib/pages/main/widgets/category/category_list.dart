import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/red-button.dart';
import 'package:location_specialist/helpers/widgets/future_widget/future_provider_custom.dart';
import 'package:location_specialist/helpers/widgets/list/list_view_paginate.dart';
import 'package:location_specialist/pages/main/providers/category_provider.dart';
import 'package:location_specialist/pages/main/widgets/category/category_item.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: FutureProviderCustom<CategoryProvider>(
        create: new CategoryProvider(),
        child: Consumer<CategoryProvider>(
            builder: (context, provider, child) => RefreshIndicator(
                  onRefresh: () async {
                    await provider.refresh();
                  },
                  child: ListViewPaginate(
                      paginator: provider,
                      itemBuilder: (context, index) {
                        return CategoryItem(
                            category: provider.categories[index]);
                      },
                      separatorBuilder: (context, index) {
                        return StyleHandler.y_margin;
                      },
                      itemCount: provider.categories.length),
                )),
      ),
    );
  }
}
