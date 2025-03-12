// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_blog/My_Colors.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/My_Strings.dart';


class RegisterInro extends StatelessWidget{
  const RegisterInro({super.key});

  @override
  Widget build(BuildContext context) {
 


      var textTheme = Theme.of(context).textTheme;
    // var size = MediaQuery.of(context).size;

    return SafeArea(child: 

    Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          SvgPicture.asset(Assets.images.smile,height: 150,),
            
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
              
              text: MyStrings.welcome,style: textTheme.titleSmall 
            
            )),
          ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: ElevatedButton(
                  onPressed: (){},
                   style:
                   
                    ButtonStyle(textStyle:
                     WidgetStateProperty.resolveWith((states) {
                
                    if(states.contains(WidgetState.pressed)){
                      return textTheme.headlineLarge;
                    } 
                    return textTheme.headlineMedium;
                   },),
                   backgroundColor: WidgetStateProperty.resolveWith((state){
                
                    if(state.contains(WidgetState.pressed)){
                
                      return SolidColors.primaryColor;
                    }
                    return SolidColors.colorTitle;
                   }
                   
                   
                   )
                   
                   
                   ),
                
                   child: Text("بزن بریم",style: TextStyle(color: Colors.white),),
                
                   ),
              )
        ],

        ),
      ),
    )
    
    );
  }

  
}