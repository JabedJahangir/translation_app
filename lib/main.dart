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
      translations: LocalizationService(),
      locale: Locale('en', 'US'), // Default language
      fallbackLocale: Locale('en', 'US'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}