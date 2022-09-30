import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import '../firebase_options.dart';

class DynamicLinkService {
  static const DynamicLinkService _instance =
      DynamicLinkService._privateConstructor();

  static DynamicLinkService get instance => _instance;

  Future activateDynamicLink() async {
    await _terminatedState();
    _foregroundState();
  }

  const DynamicLinkService._privateConstructor();

  Future initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  _redirection(PendingDynamicLinkData dynamicLinkData) {
    final Map<String, String> query = dynamicLinkData.link.queryParameters;
    print("GET HERERE::!!!");
    print(query);

    if (query.containsKey("route")) {
      Get.toNamed(query['route']!, arguments: query['args'] ?? null);
    }
  }

  _foregroundState() {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      _redirection(dynamicLinkData);
      // Get.toNamed(Routes.INITIAL);
    }).onError((error) {
      print(error);
    });
  }

  Future _terminatedState() async {
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();
    if (initialLink != null) {
      _redirection(initialLink);
      // final Uri deepLink = initialLink.link;
      // Example of using the dynamic link to push the user to a different screen
      // Get.toNamed(Routes.INITIAL);
    }
  }
}
