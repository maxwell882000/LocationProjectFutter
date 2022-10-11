import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/models/category/category.dart';
import 'package:location_specialist/pages/category/helper_widgets/category_item_in.dart';

import '../../../helpers/models/category/client_category.dart';
import 'category_client_item.dart';

class CategoryClientList extends StatelessWidget {
  final List<ClientCategory> categories;

  const CategoryClientList({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = categories
        .map<Widget>((e) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CategoryClientItem(category: e),
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
  }
}
