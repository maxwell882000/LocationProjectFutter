import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/widgets/phone_validation/widgets/base_phone_validation.dart';
import 'package:location_specialist/pages/register/providers/phone_validation_provider.dart';

class PhoneValidation extends StatelessWidget {
  const PhoneValidation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePhoneValidation<PhoneValidationProvider>(
        create: (_) => PhoneValidationProvider());
  }
}
