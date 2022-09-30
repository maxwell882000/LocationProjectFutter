import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/widgets/future_widget/future_provider_custom.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_inside.dart';
import 'package:location_specialist/pages/confedentials/provider/confidential_provider.dart';
import 'package:location_specialist/pages/confedentials/widgets/confidential_widget.dart';

class ConfidentialView extends StatelessWidget {
  const ConfidentialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldInside(
      body: FutureProviderCustom<ConfidentialProvider>(
          create: ConfidentialProvider(), child: ConfidentialWidget()),
    );
  }
}
