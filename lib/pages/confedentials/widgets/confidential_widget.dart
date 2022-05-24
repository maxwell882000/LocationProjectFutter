import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../helpers/static/style_handler.dart';
import '../../../helpers/widgets/text/text-lang.dart';
import '../../../helpers/widgets/text/text_title.dart';
import '../provider/confidential_provider.dart';

class ConfidentialWidget extends StatelessWidget {
  const ConfidentialWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
            child: TextTitle(Provider.of<ConfidentialProvider>(context)
                .confidential
                .header)),
        StyleHandler.y_margin,
        StyleHandler.y_margin,
        TextLang(Provider.of<ConfidentialProvider>(context).confidential.body),
      ],
    );
  }
}
