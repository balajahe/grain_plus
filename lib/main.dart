import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/app_locale.dart';
import '/setting/theme.dart';
import '/view/util/error.dart';
import '/view/screen/start_screen.dart';

void main() {
  ErrorWidget.builder = (e) => ErrorScreen(e);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  build(context) {
    return MaterialApp(
      title: 'Grain Plus',
      localizationsDelegates: [
        AppLocaleDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocale.supportedLanguages.map<Locale>((el) => Locale(el, '')).toList(),
      theme: themeData,
      home: StartScreen(),
    );
  }
}
