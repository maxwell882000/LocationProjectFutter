import 'package:flutter/cupertino.dart';
import 'package:location_specialist/pages/confedentials/provider/sale_text_provider.dart';

import '../../../helpers/widgets/future_widget/future_provider_custom.dart';
import '../../../helpers/widgets/scaffold/scaffold_inside.dart';
import '../provider/confidential_provider.dart';
import '../widgets/confidential_widget.dart';

class SaleTextView extends StatelessWidget {
  const SaleTextView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldInside(
      body: FutureProviderCustom<ConfidentialProvider>(
          create: SaleTextProvider(), child: ConfidentialWidget()),
    );
  }
}
