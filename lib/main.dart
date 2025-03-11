import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/My_Colors.dart';
// ignore: unused_import
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/splash_screen.dart';
void main(){

SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor:
solidColors.statusBarColor,
statusBarIconBrightness: Brightness.dark,
systemNavigationBarColor: solidColors.systemNavigationBarColor,
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
    Locale('fa, '), // farsi
  
  ],
  theme: ThemeData(
    fontFamily: 'dana',
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'dana',
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: solidColors.posteTitle
      ),
      titleLarge: TextStyle(
        fontFamily: 'dana',
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: solidColors.posterSubtitle
      ),
      headlineMedium: TextStyle(
        fontFamily: 'dana',
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: Colors.white
      ),
      
    )

  ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );

  }



}