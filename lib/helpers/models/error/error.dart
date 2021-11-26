class ErrorCustom {
  late final List<Map<String, String>> errors;
  ErrorCustom({var errors}) {
    if (errors is String) {
      this.errors = [
        {'error': errors}
      ];
    } else if (errors is List<Map<String, String>>) {
      this.errors = errors;
    }
    this.errors = _DEFAULT_ERRORS;
  }
  static const _DEFAULT_ERRORS = [
    {"error": "Произошла Ошибка"}
  ];
}
