import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:location_specialist/helpers/models/media/media.dart';

class ImagePickerCustom extends StatefulWidget {
  final Function(dynamic) onSelect;
  final Image? initialImage;
  const ImagePickerCustom({Key? key, required this.onSelect, this.initialImage})
      : super(key: key);

  @override
  _ImagePickerCustomState createState() => _ImagePickerCustomState();
}

class _ImagePickerCustomState extends State<ImagePickerCustom> {
  final ImagePicker _picker = ImagePicker();
  Image _image = Image.asset("assets/images/user.png");
  void pickImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var imagePath = image.path;
      setState(() {
        _image = Image.file(
          File.fromUri(Uri.file(imagePath)),
          fit: BoxFit.cover,
        );
        widget.onSelect(Media(path: imagePath, name: ""));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.initialImage != null) {
      setState(() {
        _image = widget.initialImage!;
      });
    }
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
