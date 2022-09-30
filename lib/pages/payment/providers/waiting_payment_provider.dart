import 'package:location_specialist/helpers/models/base/base_provider.dart';
import 'package:location_specialist/pages/payment/mixins/register_order.dart';

class WaitingPaymentProvider extends BaseProvider with RegisterOrder {
  final int id;

  WaitingPaymentProvider(this.id) {
    this.initAsync();
  }

  @override
  initAsync() {
    getUrlOrder(this.id);
  }
}
