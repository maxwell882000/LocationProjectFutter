import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Function? onTap;
  const CustomTitle(
      {Key? key, required this.title, required this.leading, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: leading,
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(flex: 8, child: title),
        ],
      ),
    );
  }
}
