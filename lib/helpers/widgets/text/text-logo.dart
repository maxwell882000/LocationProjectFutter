import 'package:flutter/material.dart';
import 'package:location_specialist/providers/common_provider.dart';
import 'package:provider/provider.dart';

class TextLogo extends StatelessWidget {
  const TextLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(
      builder: (context, provider, child) {
      return provider.initialLoaded
          ? Image.file(
              provider.logo!.logo,
              height: 200,
              width: 200,
            )
          : CircularProgressIndicator();
    });
  }
}
