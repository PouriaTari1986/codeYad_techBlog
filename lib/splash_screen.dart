import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/My_Colors.dart';
import 'package:tech_blog/Pages/main_page.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {

    Future.delayed(Duration(seconds: 3)).then((value){

      Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context)=>

        MainPage()
      
      ));

    });
    super.initState(

    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
            Assets.images.logo.image(height: 64),
            SizedBox(
              height: 32,
            ),

               SpinKitFadingCube(
               color: solidColors.primaryColor,
                size: 32.0,
)
          
            ],
          
          ),
        ),
      ),


    );
    
  }
}

