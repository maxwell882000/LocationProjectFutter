import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/future_widget/future_provider_custom.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_inside.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_main.dart';
import 'package:location_specialist/helpers/widgets/text/text-lang.dart';
import 'package:location_specialist/helpers/widgets/text/text_title.dart';
import 'package:location_specialist/pages/confedentials/provider/confidential_repository.dart';
import 'package:provider/provider.dart';

class ConfidentialView extends StatelessWidget {
  const ConfidentialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldInside(
      body: FutureProviderCustom<ConfidentialProvider>(
        create: ConfidentialProvider(),
        child: Builder(builder: (context) {
          return ListView(
            children: [
              Center(
                  child: TextTitle(Provider.of<ConfidentialProvider>(context)
                      .confidential
                      .header)),
              StyleHandler.y_margin,
              StyleHandler.y_margin,
              TextLang(
                  Provider.of<ConfidentialProvider>(context).confidential.body),
            ],
          );
        }),
      ),
    );
  }
}
