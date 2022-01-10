import 'package:get/get.dart';
import 'package:location_specialist/helpers/widgets/snackbars/snackbar_handler.dart';
import 'package:location_specialist/routes/path.dart';

class ErrorCustom {
  late final List<Map<String, String>> errors;
  ErrorCustom({var errors}) {
    if (errors is String) {
      this.errors = [
        {'error': errors}
      ];
    } else if (errors is List<Map<String, String>>) {
      this.errors = errors;
    } else if (errors is Map<String, String>) {
      this.errors = [errors];
    }
    this.errors = _DEFAULT_ERRORS;
  }

  static const _DEFAULT_ERRORS = [
    {"error": "Произошла Ошибка"}
  ];
}
