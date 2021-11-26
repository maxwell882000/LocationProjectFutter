import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/widgets/image/image_add.dart';

class CustomSlider extends StatelessWidget {
  final List<Widget> items;
  const CustomSlider({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items,
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1,
        aspectRatio: 1.45,
        initialPage: 2,
      ),
    );
  }
}
