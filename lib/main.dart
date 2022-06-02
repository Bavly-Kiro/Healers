import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pandarosh/unit/routes.dart';
import 'package:pandarosh/unit/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior:MaterialScrollBehavior().copyWith( dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown}, ),
      debugShowCheckedModeBanner: false,
      title: 'باندا روش',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeController().themeMode,
      getPages: RoutesPage.routes,
      initialRoute: RoutesPage.initScreen,
    );
  }
}

