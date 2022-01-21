import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location_specialist/helpers/models/media/media.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/helpers/widgets/future_widget/future_widget.dart';

/* onServer will take one image at a time and will give true or false response
   during upload of the file refresh indicator will be appeared
 */
class ImageMultipleCustom extends StatefulWidget {
  final Function(int) validation;
  final Future Function(Media, UniqueKey) onServer;
    final Function(UniqueKey) onDelete;
  const ImageMultipleCustom(
      {Key? key,
      required this.onDelete,
      required this.validation,
      required this.onServer})
      : super(key: key);
  @override
  _ImageMultipleCustomState createState() => _ImageMultipleCustomState();
}

class _ImageMultipleCustomState extends State<ImageMultipleCustom> {
  final ImagePicker _picker = ImagePicker();
  List<Container> images = [];

  multipleUpload() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    var newImages = [];
    if (images != null) {
      widget.validation(images.length + this.images.length);
      newImages = images.map<Future<Container>>((element) async {
        var bytes = await element.readAsBytes();
        var key = UniqueKey();
        return Container(
          key: key,
          height: 80,
          margin: EdgeInsets.all(5),
          width: 80,
          child: FutureWidget(
            request:
                widget.onServer(Media(path: element.path, name: 'images'), key),
            child: GestureDetector(
                onLongPress: () {
                  widget.onDelete(key);
                  setState(() {
                    this.images.removeWhere((element) => element.key == key);
                  });
                },
                child: Image.file(
                  File.fromUri(Uri.file(element.path)),
                  fit: BoxFit.cover,
                )),
          ),
        );
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
