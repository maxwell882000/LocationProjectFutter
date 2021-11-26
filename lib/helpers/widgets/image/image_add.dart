import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/widgets/image/image_network.dart';

class ImageAdd extends ImageNetwork {
  ImageAdd(
      {required String path, required double size, required double indicatorSize,  BoxFit fit = BoxFit.cover})
      : super(
            indicator: Center(
              child: SizedBox(
                height: indicatorSize,
                width: indicatorSize,
                child: const CircularProgressIndicator(),
              ),
            ),
            path: path,
            size: size);
}
