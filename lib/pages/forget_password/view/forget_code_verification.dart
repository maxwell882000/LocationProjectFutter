import 'package:flutter/cupertino.dart';
import 'package:location_specialist/helpers/widgets/phone_validation/widgets/base_phone_validation.dart';
import 'package:location_specialist/pages/forget_password/providers/forget_code_verification_provider.dart';

class ForgetCodeVerification extends StatelessWidget {
  const ForgetCodeVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePhoneValidation<ForgetCodeVerificationProvider>(
        create: (_) => ForgetCodeVerificationProvider());
  }
}
