import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function? onPressed;
  const BaseButton(
      {Key? key,
      this.text = "",
      this.color = Colors.white,
      @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(15),
              primary: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25))),
          onPressed: () => onPressed!(),
          child: Text(
            text.toUpperCase().tr,
            style: Theme.of(context).textTheme.button,
          )),
    );
  }
}
