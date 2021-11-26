import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/models/category/category.dart';
import 'package:location_specialist/helpers/widgets/image/image_list.dart';
import 'package:location_specialist/helpers/widgets/image/image_network.dart';
import 'package:location_specialist/routes/path.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.toNamed(Path.CATEGORY_PROFILE, arguments: this.category);
      },
      leading: ImageList(
        path: category.image,
        size: 50,),
      title: Text(category.categoryName),
    );
  }
}
/* Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: 
        ),
        
      ],
    ); */