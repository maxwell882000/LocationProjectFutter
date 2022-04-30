import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location_specialist/helpers/models/media/media.dart';

import '../future_widget/future_widget.dart';

class ImageContainer extends StatelessWidget {
  final Function(UniqueKey) onError;
  final Function onServer;
  final UniqueKey key;
  final XFile element;

  const ImageContainer({
    required this.key,
    required this.onError,
    required this.onServer,
    required this.element,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.all(5),
      width: 80,
      child: FutureWidget(
        onError: () => onError(key),
        request: onServer(Media(path: element.path, name: 'images'), key),
        child: GestureDetector(
            onLongPress: () {
              this.onError(key);
            },
            child: Image.file(
              File.fromUri(Uri.file(element.path)),
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
