// ignore: unnecessary_import, depend_on_referenced_packages
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/My_Colors.dart';
import 'package:tech_blog/My_Strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:tech_blog/my_Component.dart';


// ignore: camel_case_types
class profile_screen extends StatelessWidget {
  const profile_screen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    
    physics: BouncingScrollPhysics(),
    child:  Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      
          Assets.images.avatar.image(height: 100),
           const SizedBox(height: 12,),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.images.bluePen.image(color: SolidColors.colorTitle,height: size.height/37),
              SizedBox(width: 8,),
              Text(MyStrings.imageProfileEdit,style: textTheme.titleMedium,),
              
              
            ],
           ),
            SizedBox(height: 60,),
            Text("نام و نام خانوادگی",style: textTheme.titleSmall,),
            SizedBox(height: 25,),
      
      
            Text("emil address",style: textTheme.titleSmall,),
            SizedBox(height: 40,),
      
            TechDivider(size: size),
            InkWell(
              onTap: () {
                
              },
              splashColor: SolidColors.primaryColor,
              child: SizedBox(height: 45,
                child: Center(child: Text(MyStrings.myFavoriteBlog,style: textTheme.titleSmall,))),
            ),
      
            TechDivider(size: size),
            InkWell(
              onTap: () {
                
              },
              splashColor: SolidColors.primaryColor,
              child: SizedBox(height: 45,
                child: Center(child: Text(MyStrings.myFavoritePodCast,style: textTheme.titleSmall,))),
            ),
      
            TechDivider(size: size),
            InkWell(
              onTap: () {
                
              },
              splashColor: SolidColors.primaryColor,
              child: SizedBox(height: 45,
                child: Center(child: Text(MyStrings.logOut,style: textTheme.titleSmall,))),
            ),
            SizedBox(height: 60,)
      
        ],
      ),
    )
  
    );
  }
}


