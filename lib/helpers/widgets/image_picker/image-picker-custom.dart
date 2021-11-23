import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerCustom extends StatefulWidget {
  final Function(dynamic) onSelect;
  const ImagePickerCustom({Key? key, required this.onSelect}) : super(key: key);

  @override
  _ImagePickerCustomState createState() => _ImagePickerCustomState();
}

class _ImagePickerCustomState extends State<ImagePickerCustom> {
  final ImagePicker _picker = ImagePicker();
  Image _image = Image.asset("assets/images/user.png");
  void pickImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var imageFile = await image.readAsBytes();
      setState(() {
        _image = Image.memory(
          imageFile,
          fit: BoxFit.cover,
        );
        widget.onSelect(imageFile);
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
