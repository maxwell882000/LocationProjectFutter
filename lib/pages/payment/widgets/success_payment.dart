import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/widgets/loading/widgets/loading.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_inside.dart';
import 'package:location_specialist/pages/payment/providers/success_payment_provider.dart';
import 'package:provider/provider.dart';

class SuccessPayment extends StatelessWidget {
  const SuccessPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SuccessPaymentProvider(context),
      child: ScaffoldInside(
          body: Loading<SuccessPaymentProvider>(
        child: Center(
            child: Text(
          "Успешно оформлен платеж!!!",
          style: Get.textTheme.headline1,
        )),
      )),
    );
  }
}
