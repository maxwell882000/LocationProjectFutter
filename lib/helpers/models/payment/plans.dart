import 'package:location_specialist/helpers/models/base/base_model.dart';

class Plan extends BaseModel {
  late final String description;

  late final int amount;
  late final int days;

  Plan.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    this.description = map['description'];
    this.amount = map['amount'];
    this.days = map['days'];
  }
}
