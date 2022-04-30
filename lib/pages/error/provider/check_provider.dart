import 'dart:io';

import 'package:get/get.dart';
import 'package:location_specialist/helpers/widgets/loading/providers/loading_provider.dart';
import 'package:location_specialist/routes/path.dart';

class CheckProvider extends LoadingProvider {
  check() async {
    loading = true;
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Get.offAllNamed(Path.INITIAL);
      }
      loading = false;
    } on SocketException catch (_) {
      loading = false;
    }
  }
}
