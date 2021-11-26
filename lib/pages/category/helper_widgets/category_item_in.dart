import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/models/category/category.dart';
import 'package:location_specialist/routes/path.dart';

class CategoryItemIn extends StatelessWidget {
  final Category category;
  const CategoryItemIn({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(3), primary: Colors.red),
        onPressed: () {
          Get.toNamed(Path.CATEGORY_PROFILE, arguments: category);
        },
        child: Text(this.category.categoryName));
  }
}
