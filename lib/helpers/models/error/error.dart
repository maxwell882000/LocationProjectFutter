
class ErrorCustom {
  late final List<Map> errors;

  getFirst(String key) {
    return errors.firstWhere((element) => element.containsKey(key));
  }

  ErrorCustom({var errors}) {
    print("ERRROR");
    print(errors);
    if (errors == null || errors.isEmpty) {
      this.errors = _DEFAULT_ERRORS;
    }
    else if (errors is String) {
      this.errors = [
        {'error': errors}
      ];
    } else if (errors is List<Map<String, String>>) {
      this.errors = errors;
    } else if (errors is Map) {
      this.errors = [errors];
    }
  }

  static const _DEFAULT_ERRORS = [
    {"error": "Произошла Ошибка"}
  ];
}
