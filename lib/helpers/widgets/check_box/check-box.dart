import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';

class CheckBoxCustom extends StatefulWidget {
  final Function(bool) onPressed;
  const CheckBoxCustom({Key? key, required this.onPressed}) : super(key: key);

  @override
  _CheckBoxCustomState createState() => _CheckBoxCustomState();
}

class _CheckBoxCustomState extends State<CheckBoxCustom> {
  bool isChecked = false;
  void toggle() {
    setState(() {
      isChecked = !isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toggle();
        widget.onPressed(isChecked);
      },
      child: Container(
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: StyleHandler.backColor,
            borderRadius: BorderRadius.circular(StyleHandler.borderRadius - 5)),
        height: 25,
        width: 25,
        child: Visibility(
            visible: isChecked, child: Image.asset("assets/icons/tick.png")),
      ),
    );
  }
}
