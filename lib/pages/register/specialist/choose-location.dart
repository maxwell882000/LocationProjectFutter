import 'package:get/get.dart';
import 'package:location_specialist/pages/main/widgets/home/search.dart';

class ChooseLocation extends SearchMap {
  onTapSearch(e) {
    Get.back(result: e);
  }
}
