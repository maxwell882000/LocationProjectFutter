import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/models/category/category.dart';
import 'package:location_specialist/helpers/models/category/client_category.dart';
import 'package:location_specialist/routes/path.dart';

class CategoryClientItem extends StatelessWidget {
  final ClientCategory category;

  const CategoryClientItem({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(3), primary: Colors.red),
        onPressed: () {},
        child: Text(
          this.category.name,
          overflow: TextOverflow.ellipsis,
        ));
  }
}
