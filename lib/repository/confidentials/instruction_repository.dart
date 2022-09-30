import 'package:location_specialist/helpers/models/confidential/confidential.dart';
import 'package:location_specialist/repository/mixin/api_base_methods.dart';
import 'package:location_specialist/repository/model/request.dart';

class InstructionRepository with ApiBaseMethods {
  static final InstructionRepository _singleton =
      InstructionRepository._internal();

  factory InstructionRepository() {
    return _singleton;
  }

  InstructionRepository._internal();

  static const String prefix = "confidential/instructions/get/";

  Future<Confidential> getConfidential() async {
    var response = await this.get(Request(prefix));
    return Confidential.fromJson(response);
  }
}
