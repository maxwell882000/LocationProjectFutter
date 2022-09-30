import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/models/category/category.dart';
import 'package:location_specialist/pages/category/helper_widgets/category_item_in.dart';

class CategoryListItem extends StatelessWidget {
  final List<Category> categories;

  const CategoryListItem({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = categories
        .map<Widget>((e) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CategoryItemIn(category: e),
            ))
        .toList();
    return SizedBox(
      width: Get.width,
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: items,
      ),
    );
    // return CarouselSlider(
    //   items:
    //       categories.map<Widget>((e) => CategoryItemIn(category: e)).toList(),
    //   options: CarouselOptions(
    //     viewportFraction: 0.35,
    //     enableInfiniteScroll: false,
    //     height: 40,
    //   ),
    // );
  }
}
