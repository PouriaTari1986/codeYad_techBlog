// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/My_Strings.dart';
import 'package:tech_blog/my_Component.dart';
import 'package:validators/validators.dart';

class RegisterIntro extends StatelessWidget{
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
 


      var textTheme = Theme.of(context).textTheme;
       var size = MediaQuery.of(context).size;

    return SafeArea(child: 

    Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          SvgPicture.asset(Assets.images.smile,height: 100,),
            
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
              
              text: MyStrings.welcome,style: textTheme.titleSmall 
            
            )),
          ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ElevatedButton(
                  onPressed: (){
                    _activationCodeSheet(context, size, textTheme);
                  },
                   
                   
                    
                
                   child: Text("بزن بریم",style: textTheme.headlineSmall,),
                
                   ),
              )
        ],

        ),
      ),
    )
    
    );
  }

  Future<dynamic> _activationCodeSheet(BuildContext context, Size size, TextTheme textTheme) {



    return showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                   builder: ((context){
                    
                    return Padding(
                      padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Container(
                        height: size.height/2.6,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45)
                          )
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                      
                              Text(MyStrings.insertYourEmail,style: textTheme.titleMedium,),
                              SizedBox(height: 12,),
                              Padding(
                                padding: const EdgeInsets.all(24),
                                child: TextField(
                                  onChanged: (value) {

                                    isEmail(value);
                                    
                                  },
                                  style: textTheme.headlineSmall,                                  
                                  textAlign: TextAlign.center,
                                  decoration: 
                                  InputDecoration(
                                    hintText: "Exampel@xmail.com",
                                    hintStyle: textTheme.headlineSmall
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: ((){

                                  Navigator.pop(context);
                                  _activationCodeButtomSheet(context, size, textTheme);
                                }),
                      
                                 child: 
                                 Text("ادامه",style: textTheme.headlineSmall,))
                            ],
                          )
                        ),
                      ),
                    );
                   })
                   );
  }
  Future<dynamic> _activationCodeButtomSheet(BuildContext context, Size size, TextTheme textTheme) {



    return showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                   builder: ((context){
                    
                    return Padding(
                      padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Container(
                        height: size.height/2.6,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45)
                          )
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                      
                              Text(MyStrings.insertActivationCode,style: textTheme.titleMedium,),
                              SizedBox(height: 12,),
                              Padding(
                                padding: const EdgeInsets.all(24),
                                child: TextField(
                                  onChanged: (value) {

                                    isEmail(value);
                                    
                                  },
                                  style: textTheme.headlineSmall,                                  
                                  textAlign: TextAlign.center,
                                  decoration: 
                                  InputDecoration(
                                    hintText: "******",
                                    hintStyle: textTheme.headlineSmall
                                  ),
                                ),
                              ),
                              Botton()
                            ],
                          )
                        ),
                      ),
                    );
                   })
                   );
  }

  
}

