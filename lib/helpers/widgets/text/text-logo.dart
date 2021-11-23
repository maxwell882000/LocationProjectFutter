import 'package:flutter/material.dart';

class TextLogo extends StatelessWidget {
  const TextLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "ABC",
      style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
    );
  }
}
