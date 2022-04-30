import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FutureWidget extends StatelessWidget {
  final Function? onError;
  final Future request;
  final Widget child;

  const FutureWidget({
    Key? key,
    required this.child,
    required this.request,
    this.onError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: this.request,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            if (onError != null) onError!();
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return child;
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
