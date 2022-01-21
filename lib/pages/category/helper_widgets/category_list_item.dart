import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/models/category/category.dart';
import 'package:location_specialist/pages/category/helper_widgets/category_item_in.dart';
import 'package:location_specialist/pages/main/widgets/category/category_item.dart';

class CategoryListItem extends StatelessWidget {
  final List<Category> categories;
  const CategoryListItem({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items:
          categories.map<Widget>((e) => CategoryItemIn(category: e)).toList(),
      options: CarouselOptions(
        viewportFraction: 0.35,
        enableInfiniteScroll: false,
        height: 40,
      ),
    );
  }
}
