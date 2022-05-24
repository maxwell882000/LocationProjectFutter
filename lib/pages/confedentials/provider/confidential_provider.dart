import 'package:location_specialist/helpers/models/base/base_provider.dart';
import 'package:location_specialist/helpers/models/confidential/confidential.dart';
import 'package:location_specialist/repository/confidentials/confidential_repository.dart';

class ConfidentialProvider extends BaseProvider {
  late Confidential confidential;

  @override
  initAsync() async {
    this.confidential = await ConfidentialRepository().getConfidential();
  }
}
