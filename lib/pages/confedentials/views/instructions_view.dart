import 'package:flutter/cupertino.dart';
import 'package:location_specialist/pages/confedentials/provider/confidential_provider.dart';
import 'package:location_specialist/pages/confedentials/provider/instructions_provider.dart';

import '../../../helpers/widgets/future_widget/future_provider_custom.dart';
import '../../../helpers/widgets/scaffold/scaffold_inside.dart';
import '../widgets/confidential_widget.dart';

class InstructionsView extends StatelessWidget {
  const InstructionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldInside(
      body: FutureProviderCustom<ConfidentialProvider>(
          create: InstructionProvider(), child: ConfidentialWidget()),
    );
  }
}
