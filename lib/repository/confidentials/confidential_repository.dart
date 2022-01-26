import 'package:location_specialist/helpers/models/confidential/confidential.dart';
import 'package:location_specialist/repository/mixin/api_base_methods.dart';
import 'package:location_specialist/repository/model/request.dart';

class ConfidentialRepository with ApiBaseMethods {
  static final ConfidentialRepository _singleton =
      ConfidentialRepository._internal();

  factory ConfidentialRepository() {
    return _singleton;
  }
  ConfidentialRepository._internal();

  static const String prefix = "confidential/get/";
  Future<Confidential> getConfidential() async {
    var response = await this.get(Request(prefix));
    return Confidential.fromJson(response);
  }
}
