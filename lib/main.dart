import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translated_api_app/core/l10n/localization.dart';
import 'package:translated_api_app/presesntation/screens/home_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Post Viewer',
      debugShowCheckedModeBanner: false,
      translations: LocalizationService(),           // For .tr localization
      locale: Locale('en', 'US'),                    // Default locale
      fallbackLocale: Locale('en', 'US'),            // Fallback if missing
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
