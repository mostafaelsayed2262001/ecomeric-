import 'package:ecomerec/lib/languages/localiztion.dart';
import 'package:ecomerec/lib/logic/controllers/theme_controller.dart';
import 'package:ecomerec/lib/routes/routes.dart';
import 'package:ecomerec/lib/utils/my_string.dart';
import 'package:ecomerec/lib/utils/themes.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      locale: Locale(ene),
      fallbackLocale: Locale(GetStorage().read('lang').toString()),
      translations: LocaliztionApp(),
      themeMode: ThemeController().themeDataGet,
      title: 'E-commerec app',
      initialRoute: GetStorage().read<bool>('auth') == true
          ? AppRoutes.mainScreen
          : AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}
