// ignore_for_file: depend_on_referenced_packages, camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/my_Colors.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/view/home_screen.dart';
import 'package:tech_blog/view/profile_screen.dart';
// import 'package:flutter_svg/flutter_svg.dart';



class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}


    var selectedPageIndex = 0;

class _mainScreenState extends State<mainScreen> {
  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;




    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
          elevation: 0,
          backgroundColor: SolidColors.scaffoldBackGround,
          title: 
          Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(CupertinoIcons.search,color: Colors.black,),
                
                    Assets.images.logo.image(height: size.height / 13.6),
                
                    Icon(CupertinoIcons.line_horizontal_3,color: Colors.black,),
                  ],
                ),
        ),
        body: Stack(
          children: 
          [
            Center(
              child: Positioned.fill(child:
              IndexedStack(
                index: selectedPageIndex,
                children: [
                  HomeScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                  profile_screen(size: size, textTheme: textTheme, bodyMargin: bodyMargin)
                ],
              )
               ),
            ),
            BottomNavigation(size: size,
             bodyMargin: bodyMargin,
             changeScreen: (int value){

                setState(() {
                  selectedPageIndex = value;
                });

             }
             ),


          
          
          
          
          ]
        ),
       
        
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  });

  final Size size;
  final double bodyMargin;
  final Function (int) changeScreen;
  
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
              height: size.height/10,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: 
                GradiantColors.bottomNavBackGround,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
      
              ),
              child: Padding(
                padding:  EdgeInsets.only(left: bodyMargin,right: bodyMargin),
                child: Container(
      height: size.height/8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        gradient:    LinearGradient(colors: 
      GradiantColors.bottomNav
      ),
                 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed:
           (){},
                
            icon: Assets.images.submit.image(color: Colors.white)),
          IconButton(onPressed:
           (){changeScreen(0);},
                
            icon: Assets.images.home.image(color: Colors.white)),
          IconButton(onPressed:
           ()=>changeScreen(1),
                
            icon: Assets.images.user.image(color: Colors.white)),
        ],
      ),
                ),
              ),
              ),
    );
  }
}


