import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/red-button.dart';
import 'package:location_specialist/helpers/widgets/phone_validation/widgets/base_phone_validation.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_auth.dart';
import 'package:location_specialist/helpers/widgets/snackbars/snackbar_handler.dart';
import 'package:location_specialist/pages/register/providers/phone_validation_provider.dart';
import 'package:location_specialist/routes/path.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class PhoneValidation extends StatelessWidget {
  const PhoneValidation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePhoneValidation<PhoneValidationProvider>(
        create: (_) => PhoneValidationProvider());
  }
}
