import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Adds extends StatelessWidget {
  const Adds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Container(
            child: Image.asset(
          "assets/images/back-image.png",
          fit: BoxFit.cover,
        )),
        Container(
            height: Get.height * 0.4,
            width: double.infinity,
            color: Colors.black,
            child: Text("ASD")),
      ],
/*           carouselController: buttonCarouselController, */
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
