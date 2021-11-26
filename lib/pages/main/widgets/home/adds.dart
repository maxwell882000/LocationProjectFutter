import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/widgets/future_widget/future_provider_custom.dart';
import 'package:location_specialist/helpers/widgets/image/image_add.dart';
import 'package:location_specialist/helpers/widgets/image/image_network.dart';
import 'package:location_specialist/helpers/widgets/slider/custom_slider.dart';
import 'package:location_specialist/pages/main/providers/add_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Adds extends StatelessWidget {
  const Adds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureProviderCustom<AddProvider>(
      create: new AddProvider(),
      child: Consumer<AddProvider>(
          builder: (BuildContext context, provider, Widget? child) {
        return CustomSlider(
          items: provider.adds
              .map<Widget>((e) => GestureDetector(
                    onTap: () {
                      launch(Uri.parse(e.link).toString());
                    },
                    child: ImageAdd(
                      path: e.image,
                      size: double.infinity,
                      indicatorSize: 50,
                    ),
                  ))
              .toList(),
        );
      }),
    );
  }
}
