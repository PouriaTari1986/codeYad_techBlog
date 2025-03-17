// ignore_for_file: depend_on_referenced_packages, camel_case_types
// ignore: unnecessary_import
import 'package:flutter/rendering.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/component/my_strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/view/home_screen.dart';
import 'package:tech_blog/view/profile_screen.dart';
import 'package:tech_blog/view/register_intro.dart';
// import 'package:flutter_svg/flutter_svg.dart';







// ignore: must_be_immutable
class MainScreen extends StatelessWidget {

  RxInt selectedPageIndex = 0.obs;

  MainScreen({super.key});




 
  @override
  Widget build(BuildContext context) {



    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;




    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: SolidColors.scaffoldBackGround,
          child: 
            Padding(
              padding:  EdgeInsets.only(right: bodyMargin),
              child: ListView(
                children: [
                  DrawerHeader(
                    child:
                    Center(
                      child: Assets.images.logo.image(height: 65)
                    )
                  
                   ),
                   ListTile(
                    title: Text("پروفایل کاربری",style: textTheme.titleSmall,),
                    onTap: () {
                      
                    },
                   ),
                   Divider(
                    color: SolidColors.divider,
                   ),
                   ListTile(
                    title: Text(" درباره تک بلاگ",style: textTheme.titleSmall,),
                    onTap: () {
                      
                    },
                   ),
                   Divider(
                    color: SolidColors.divider,
                   ),
                   ListTile(
                    title: Text(" اشتراک گذاری تک بلاگ",style: textTheme.titleSmall,),
                    onTap: () async{
                      await Share.share(MyStrings.shatePage);
                    },
                   ),
                   Divider(
                    color: SolidColors.divider,
                   ),
                   ListTile(
                    title: Text(" تک بلاگ در گیت هاب",style: textTheme.titleSmall,),
                    onTap: () {
                      mylaunchUrl(MyStrings.techBlogGitHubUrl);
                    },
                   ),
                   Divider(
                    color: SolidColors.divider,
                   ),
                ],
              ),
            )
          
          ,
        ),
        appBar: AppBar(
          
          elevation: 0,
          backgroundColor: SolidColors.scaffoldBackGround,
          title: 
          Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                SizedBox(width: 12,),
                    Assets.images.logo.image(height: size.height / 13.6), 

                      SizedBox(width: 15,),
                    Icon(CupertinoIcons.search,color: Colors.black,),

                  ],
                ),
        ),
        body: Stack(
          children: 
          [
            Positioned.fill(child:
            Obx(
              ()=> IndexedStack(
              
                index: selectedPageIndex.value,
              
              
                children: [
                  HomeScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                  profile_screen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                  RegisterIntro(),
              
                ],
              ),
            )
             ),
            BottomNavigation(size: size,
             bodyMargin: bodyMargin,
             changeScreen: (int value){

         
                  selectedPageIndex.value = value;
            

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
      bottom: 8,
      right: 0,
      left: 0 ,
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
           (){changeScreen(0);},
                
            icon: Assets.images.home.image(color: Colors.white,height: size.height/22)),

          IconButton(onPressed:
           ()=>changeScreen(2),
                
            icon: Assets.images.submit.image(color: Colors.white,height: size.height/22)),

          IconButton(onPressed:
           ()=>changeScreen(1),
                
            icon: Assets.images.user.image(color: Colors.white,height: size.height/22)),
        ],
      ),
                ),
              ),
              ),
    );
  }
}


