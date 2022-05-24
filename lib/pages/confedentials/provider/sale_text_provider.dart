import 'package:location_specialist/pages/confedentials/provider/confidential_provider.dart';
import 'package:location_specialist/repository/confidentials/sale_text_repository.dart';

class SaleTextProvider extends ConfidentialProvider {
  @override
  initAsync() async {
    this.confidential = await SaleTextRepository().getConfidential();
  }
}