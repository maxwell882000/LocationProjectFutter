import 'package:location_specialist/helpers/models/payment/plans.dart';
import 'package:location_specialist/repository/mixin/api_base_methods.dart';

import '../model/request.dart';

class PlanRepository with ApiBaseMethods {
  static final PlanRepository _singleton = PlanRepository._internal();

  factory PlanRepository() {
    return _singleton;
  }

  PlanRepository._internal();

  static const String prefix = "plan/";

  Future<List<Plan>> getPlans() async {
    final List response = await this.get(Request(prefix + "get/"));
    return response.map<Plan>((e) => Plan.fromJson(e)).toList();
  }
}
