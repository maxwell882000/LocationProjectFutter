import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:location_specialist/pages/location/provider/location_form_provider.dart';
import 'package:location_specialist/providers/auth_provider.dart';
import 'package:location_specialist/providers/common_provider.dart';
import 'package:location_specialist/routes/route.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'services/translation_service.dart';

Future<void> initServices() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.location,
    Permission.storage,
  ].request();
  await Get.putAsync(() => TranslationService().init());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.a
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider<CommonProvider>(
          create: (_) => CommonProvider(),
        ),
        ChangeNotifierProvider<LocationFormProvider>(
            create: (_) => LocationFormProvider())
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Location App',
        theme: ThemeData(
            primaryColor: Colors.white,
            primaryIconTheme: IconThemeData(color: Colors.black),
            iconTheme: IconThemeData(color: Colors.black),
            appBarTheme: AppBarTheme(
              color: Colors.white,
            ),
            scaffoldBackgroundColor: Colors.white,
            fontFamily: "Montserrat",
            textTheme: TextTheme(
                bodyText1: TextStyle(
                  color: Color.fromRGBO(85, 85, 85, 0.7),
                ),
                button: TextStyle(
                  color: Colors.white,
                ),
                headline1: TextStyle(
                    color: Color.fromRGBO(29, 24, 24, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
