import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/models/category/category.dart';
import 'package:location_specialist/helpers/widgets/image/image_list.dart';
import 'package:location_specialist/helpers/widgets/image/image_network.dart';
import 'package:location_specialist/helpers/widgets/text/text-lang.dart';
import 'package:location_specialist/helpers/widgets/text/text_title.dart';
import 'package:location_specialist/helpers/widgets/title/custom_title.dart';

class CategoryImage extends StatelessWidget {
  final Category category;
  const CategoryImage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: CustomTitle(
        leading: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            print(constraints);
            return ImageList(
              path: category.image,
              size: 100,
              fit: BoxFit.fill,
            );
          },
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(flex: 2, child: TextTitle(category.categoryName)),
            Flexible(child: TextLang(category.description))
          ],
        ),
      ),
    );
  }
}
