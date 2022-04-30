import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location_specialist/helpers/models/media/media.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/helpers/widgets/future_widget/future_widget.dart';
import 'package:location_specialist/helpers/widgets/image_picker/image-container.dart';

/* onServer will take one image at a time and will give true or false response
   during upload of the file refresh indicator will be appeared
 */

class ImageMultipleCustom extends StatefulWidget {
  final Function(int) validation;
  final List<ImageContainer> storeImages;
  final Future Function(Media, UniqueKey) onServer;
  final Function(UniqueKey) onDelete;

  const ImageMultipleCustom(
      {Key? key,
      required this.onDelete,
      required this.storeImages,
      required this.validation,
      required this.onServer})
      : super(key: key);

  @override
  _ImageMultipleCustomState createState() => _ImageMultipleCustomState();
}

class _ImageMultipleCustomState extends State<ImageMultipleCustom> {
  final ImagePicker _picker = ImagePicker();
  List<ImageContainer> images = [];

  @override
  initState() {
    super.initState();
    setState(() {
      images = [...widget.storeImages];
    });
  }

  delete(UniqueKey key) {
    widget.onDelete(key);
    this.images.removeWhere((element) => element.key == key);
  }

  generateImageContainer(XFile element) {
    var key = UniqueKey();
    return ImageContainer(
        key: key, onError: delete, onServer: widget.onServer, element: element);
  }

  multipleUpload() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    var newImages = [];

    if (images != null) {
      // before submit we check how many images we expected to be;
      // if the figure is not equal as we expect, next step is not
      // allowed
      widget.validation(images.length + this.images.length);

      newImages = images.map<Future<ImageContainer>>((element) async {
        ImageContainer image = generateImageContainer(element);
        widget.storeImages.add(image);
        return image;
      }).toList();
    }

    newImages.forEach((element) async {
      this.images.add(await element);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: this.images,
        ),
        StyleHandler.y_margin,
        BlackButton(
          text: "Добавить фото",
          onPressed: () {
            this.multipleUpload();
          },
        )
      ],
    );
  }
}
