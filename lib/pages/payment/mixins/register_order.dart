import 'package:url_launcher/url_launcher.dart';

import '../../../repository/payment/payment_repository.dart';

class RegisterOrder {
  Future getUrlOrder(id) async {
    final String url = await PaymentRepository().registerOrder(id);
    launch(url);
  }
}
