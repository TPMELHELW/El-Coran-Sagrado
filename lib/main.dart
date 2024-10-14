import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/features/quran/quran_bindings.dart';
import 'package:quran_app/features/splash/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences pref = await SharedPreferences.getInstance();
  Get.put(pref);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'El Corán Sagrado - Español',
      initialBinding: QuranBindings(),
      home: const SplashScreen(),
    );
  }
}
