import 'package:get/get.dart';
import 'package:location_specialist/helpers/models/base/base_provider.dart';
import 'package:location_specialist/helpers/models/specialist/specialist.dart';

class SpecialistViewProvider extends BaseProvider {
  late Specialist specialist;
  SpecialistViewProvider() {
    this.specialist = Get.arguments as Specialist;
  }
  @override
  initAsync() {
    // TODO: implement initAsync
    throw UnimplementedError();
  }
}
