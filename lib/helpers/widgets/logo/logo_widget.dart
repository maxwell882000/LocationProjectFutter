import 'package:flutter/material.dart';
import 'package:location_specialist/providers/common_provider.dart';
import 'package:provider/provider.dart';

class LogoWidget extends StatelessWidget {
  final double size;
  const LogoWidget({Key? key, this.size = 200}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(builder: (context, provider, child) {
      return provider.initialLoaded
          ? Image.file(
              provider.logo!.logo,
              height: this.size,
              width: this.size,
            )
          : CircularProgressIndicator();
    });
  }
}
