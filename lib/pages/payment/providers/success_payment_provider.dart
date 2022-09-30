import 'package:get/get.dart';
import 'package:location_specialist/helpers/widgets/loading/providers/loading_provider.dart';
import 'package:location_specialist/providers/auth_provider.dart';
import 'package:location_specialist/repository/payment/payment_repository.dart';
import 'package:location_specialist/routes/path.dart';
import 'package:provider/provider.dart';

class SuccessPaymentProvider extends LoadingProvider {
  SuccessPaymentProvider(context) {
    getAsync(context);
  }

  getAsync(context) async {
    this.loading = true;
    try {
      final isAutoPayment = await PaymentRepository().statusOrder();
      Provider.of<AuthProvider>(context, listen: false)
          .activateSpecialist(isAutoPayment);
    } catch (e, stacktrace) {
      print(stacktrace);
      Get.toNamed(Path.FAIL_PAYMENT);
      print(e);
    }
    this.loading = false;
  }
}
