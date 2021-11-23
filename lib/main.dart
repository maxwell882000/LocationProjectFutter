
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:location_specialist/routes/route.dart';
import 'package:permission_handler/permission_handler.dart';

import 'services/translation_service.dart';

Future<void> initServices() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.location,
    Permission.storage,
  ].request();
  print(statuses[Permission.location]);
  await Get.putAsync(() => TranslationService().init());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Location App',
      theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: "Montserrat",
          textTheme: TextTheme(
              bodyText1: TextStyle(
                color: Color.fromRGBO(85, 85, 85, 0.7),
              ),
              button: TextStyle(
                color: Colors.white,
              ),
              headline6: TextStyle(
                  color: Color.fromRGBO(70, 67, 67, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.bold))),
      initialRoute: Routes.INITIAL,
      getPages: Routes.routes,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: Get.find<TranslationService>().supportedLocales(),
      translationsKeys: Get.find<TranslationService>().translations,
    );
  }
}
