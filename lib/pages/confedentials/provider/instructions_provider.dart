import 'package:location_specialist/pages/confedentials/provider/confidential_provider.dart';
import 'package:location_specialist/repository/confidentials/instruction_repository.dart';

class InstructionProvider extends ConfidentialProvider {
  @override
  initAsync() async {
    this.confidential = await InstructionRepository().getConfidential();
  }
}