import 'package:location_specialist/helpers/models/error/error.dart';
import 'package:location_specialist/helpers/widgets/loading/providers/loading_provider.dart';
import 'package:location_specialist/helpers/widgets/snackbars/snackbar_handler.dart';
import 'package:location_specialist/pages/payment/mixins/register_order.dart';
import 'package:location_specialist/repository/payment/plan_repository.dart';

import '../../../helpers/models/payment/plans.dart';

class PlanProvider extends LoadingProvider with RegisterOrder {
  List<Plan> _plan = [];
  int _selected = -1;

  int get selected => _selected;

  set selected(int selected) {
    _selected = selected;
    notifyListeners();
  }

  List<Plan> get plan => _plan;

  set plan(List<Plan> plan) {
    _plan = plan;
    notifyListeners();
  }

  PlanProvider() {
    this.initAsync();
  }

  initAsync() async {
    this.loading = true;
    this.plan = await PlanRepository().getPlans();
    this.loading = false;
  }

  registerOrder() async {
    this.loading = true;
    try {
      if (this.selected == -1) {
        throw ErrorCustom(errors: "Выберите тариф !!!");
      }
      await getUrlOrder(plan[this.selected].id);
    } on ErrorCustom catch (e) {
      print(e);
      SnackbarHandler.error(title: "Ошибка", body: e.errors[0]['error']);
    }
    this.loading = false;
  }
}
