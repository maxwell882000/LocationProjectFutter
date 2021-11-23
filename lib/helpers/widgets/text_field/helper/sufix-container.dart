import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SufixContainer extends StatelessWidget {
  final String text;
  final Function? onClick;
  const SufixContainer({Key? key, this.text = "", this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick!(),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.all(2),
          child: Text(
            text.tr,
            style: Theme.of(context).textTheme.headline6,
          )),
    );
  }
}
