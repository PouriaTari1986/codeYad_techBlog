// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/view/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //the is the root project
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa', ''), // farsi
      ],

      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 2),
          ),
          filled: true,
          fillColor: Colors.white
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return textTheme.headlineLarge;
              }
              return textTheme.headlineMedium;
            }),
            backgroundColor: WidgetStateProperty.resolveWith((state) {
              if (state.contains(WidgetState.pressed)) {
                return SolidColors.colorTitle;
              }
              return SolidColors.primaryColor;
            }),
          ),
        ),
        fontFamily: 'dana',
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: SolidColors.hintTextColor
          ),
          headlineSmall: TextStyle(
            fontFamily: 'dana',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: SolidColors.posteTitle,
          ),
          titleLarge: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: SolidColors.posterSubtitle,
          ),
          titleMedium: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: SolidColors.colorTitle,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
          titleSmall: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
