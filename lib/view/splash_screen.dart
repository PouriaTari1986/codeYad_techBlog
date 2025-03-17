// ignore_for_file: depend_on_referenced_packages, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/view/main_screen.dart';
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

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>

        MainScreen()
      
      ));

    });
    super.initState(

    );
  }

  @override
  Widget build(BuildContext context) {

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

               Loading()
          
            ],
          
          ),
        ),
      ),


    );
    
  }
}

