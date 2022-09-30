import 'package:location_specialist/helpers/models/confidential/confidential.dart';
import 'package:location_specialist/repository/mixin/api_base_methods.dart';
import 'package:location_specialist/repository/model/request.dart';

class PaymentRepository with ApiBaseMethods {
  static final PaymentRepository _singleton = PaymentRepository._internal();

  factory PaymentRepository() {
    return _singleton;
  }

  PaymentRepository._internal();

  static const String prefix = "payment/";

  Future<bool> unBind() async {
    var response = await this.get(Request(prefix + "unbind/"));
    return true;
  }

  Future<Confidential> reBind() async {
    var response = await this.get(Request(prefix + "rebind/"));
    return Confidential.fromJson(response);
  }

  Future<String> registerOrder(int planId) async {
    var response = await this
        .post(Request(prefix + "register_order/", data: {"plan_id": planId}));
    return response['formUrl'];
  }

  Future<bool> statusOrder() async {
    var response = await this.get(Request(prefix + "status_order/"));
    print(response);
    return response['is_auto_payment'];
  }
}
