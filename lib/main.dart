import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:untitled/appLocal.dart';
import 'package:untitled/layout_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      localizationsDelegates: const [
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [
        Locale("en", ""),
        Locale("ar", ""),
      ],
//للتحكم ف لغة التليفون  من غير الجهاز
      locale: const Locale("ar", ""),
      localeResolutionCallback: (current, supertlocals) {
        if (current != null) {
          for (Locale local in supertlocals) {
            if (current.languageCode == local.languageCode) {
              return current;
            }
          }
        }
        return supertlocals.first;
      },

      home: HomeView(),
    );
  }
}
