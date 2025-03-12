// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/view/splash_screen.dart';
// import 'package:tech_blog/view/splash_screen.dart';
void main(){

SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor:
SolidColors.statusBarColor,
statusBarIconBrightness: Brightness.dark,
systemNavigationBarColor: SolidColors.systemNavigationBarColor,
systemNavigationBarIconBrightness: Brightness.dark
 ));
runApp(MyApp());


}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  
//the is the root project
  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(

              title: 'Localizations Sample App',
  localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: [
    Locale('fa',''), // farsi
  
  ],


  theme: ThemeData(
    fontFamily: 'dana',
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'dana',
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: SolidColors.posteTitle
      ),
      titleLarge: TextStyle(
        fontFamily: 'dana',
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: SolidColors.posterSubtitle
      ),
      titleMedium: TextStyle(
        fontFamily: 'dana',
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: SolidColors.colorTitle
      ),
      headlineMedium: TextStyle(
        fontFamily: 'dana',
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.white
      ),
      titleSmall: TextStyle(
        fontFamily: 'dana',
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: const Color.fromARGB(255, 0, 0, 0)
      ),
      
    )

  ),
      debugShowCheckedModeBanner: false,
      // home: RegisterInro()
      home: SplashScreen()
    );

  }



}