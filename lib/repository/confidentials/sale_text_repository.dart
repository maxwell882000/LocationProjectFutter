import 'package:location_specialist/helpers/models/confidential/sale_text.dart';
import 'package:location_specialist/repository/mixin/api_base_methods.dart';

import '../model/request.dart';

class SaleTextRepository with ApiBaseMethods {
  static final SaleTextRepository _singleton = SaleTextRepository._internal();

  factory SaleTextRepository() {
    return _singleton;
  }

  SaleTextRepository._internal();

  static const String prefix = "confidential/sales/get/";

  Future<SaleText> getConfidential() async {
    var response = await this.get(Request(prefix));
    return SaleText.fromJson(response);
  }
}
