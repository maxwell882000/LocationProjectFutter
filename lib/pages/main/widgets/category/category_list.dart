import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/pages/main/providers/category_provider.dart';
import 'package:location_specialist/pages/main/widgets/category/category_item.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryProvider>(
      create: (_) => new CategoryProvider(),
      child: Consumer<CategoryProvider>(
        builder:(context, provider, child) => ListView.separated(
            itemBuilder: (context, index) {
              return CategoryItem(category: provider.categories[index]);
            },
            separatorBuilder: (context, index) {
              return StyleHandler.y_margin;
            },
            
            itemCount: provider.categories.length),
      ),
    );
  }
}