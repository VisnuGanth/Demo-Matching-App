import 'package:demo_matching_apps/ind_profile_1.dart';
import 'package:demo_matching_apps/locale/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //Set default language to English
    AppLocalizationDelegate _localeOverrideDelegate = AppLocalizationDelegate(Locale('en', 'US'));


    return new MaterialApp(

      //Delegates used to support language switch
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        _localeOverrideDelegate
      ],

      //Supported Languages
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('ja', 'JP')
      ],

      debugShowCheckedModeBanner:false,
      title: 'Flutter Demo',

      theme: new ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: IndProfile1(),
    );
  }
}