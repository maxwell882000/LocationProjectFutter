import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/future_widget/future_provider_custom.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_inside.dart';
import 'package:location_specialist/pages/category/provider/category_view_provider.dart';
import 'package:location_specialist/pages/category/widgets/category_image.dart';
import 'package:location_specialist/pages/location/widgets/location_item.dart';
import 'package:provider/provider.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldInside(
      body: FutureProviderCustom<CategoryViewProvider>(
        create: new CategoryViewProvider(),
        child: ListView(
          children: [
            Consumer<CategoryViewProvider>(builder: (context, provider, child) {
              return CategoryImage(category: provider.category);
            }),
            StyleHandler.y_margin,
            Consumer<CategoryViewProvider>(builder: (context, provider, child) {
              return Column(
                children: provider.category.location
                    .map<Widget>((e) => LocationItem(location: e))
                    .toList(),
              );
            })
          ],
        ),
      ),
    );
  }
}
