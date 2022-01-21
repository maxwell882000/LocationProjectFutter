import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:location_specialist/helpers/models/media/media.dart';
import 'package:location_specialist/helpers/widgets/future_widget/future_widget.dart';
import 'package:location_specialist/helpers/widgets/image/image_list.dart';

class ImagePickerCustom extends StatefulWidget {
  final Future Function(Media) onServer;
  final Function onDelete;

  final String? initialImage;
  const ImagePickerCustom(
      {Key? key,
      required this.onDelete,
      required this.onServer,
      this.initialImage})
      : super(key: key);

  @override
  _ImagePickerCustomState createState() => _ImagePickerCustomState();
}

class _ImagePickerCustomState extends State<ImagePickerCustom> {
  final ImagePicker _picker = ImagePicker();
  final Widget initial = Image.asset("assets/images/user.png");
  Widget _image = Image.asset("assets/images/user.png");
  void pickImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var imagePath = image.path;
      setState(() {
        _image = FutureWidget(
          request: widget.onServer(Media(path: imagePath, name: "temp")),
          child: GestureDetector(
            onLongPress: () {
              setInitial();
              widget.onDelete();
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                File.fromUri(Uri.file(imagePath)),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      });
    }
  }

  setInitial() {
    setState(() {
      if (widget.initialImage != null) {
        print(widget.initialImage!);
        _image = ImageList(
          size: 200,
          path: widget.initialImage!,
        );
      } else {
        _image = initial;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    setInitial();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pickImage();
      },
      child: Container(
        height: 200,
        width: 200,
        child: _image,
      ),
    );
  }
}
