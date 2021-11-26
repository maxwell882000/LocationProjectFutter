import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/widgets/image/image_network.dart';

class ImageList extends ImageNetwork {
  ImageList(
      {required String path, required double size, BoxFit fit = BoxFit.cover})
      : super(
            indicator: Container(
              margin: EdgeInsets.all(6),
              height: size - 10,
              width: size - 10,
              child: const CircularProgressIndicator(),
            ),
            fit: fit,
            path: path,
            size: size);
}
