import 'package:flutter/material.dart';

class StarWidget extends StatelessWidget {
  final int rank;
  const StarWidget({Key? key, required this.rank}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          this.rank, (index) => Flexible(child: Image.asset("assets/images/star.png"))).toList(),
    );
  }
}
