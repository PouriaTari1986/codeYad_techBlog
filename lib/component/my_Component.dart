// ignore: depend_on_referenced_packages
import 'dart:developer'as developer;

// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/view/register_complete.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';


class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.1,
      color: SolidColors.divider,
      indent: size.width/6,
      endIndent: size.width/6,
    );
  }
}




// ignore: must_be_immutable
class MainTags extends StatelessWidget {
   MainTags({
    super.key,
    required this.textTheme,
    required this.index,
  });



  final TextTheme textTheme;
  // ignore: prefer_typing_uninitialized_variables
  var index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        gradient: LinearGradient(
          colors: GradiantColors.hashtagBg,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width/0.8,
        height: 25,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 6,),
              Icon(Icons.tag, color: Colors.white, size: 18),
            
              Text(
               Get.find<HomeScreenController>().tagList[index].title!,
                style: textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class Botton extends StatelessWidget {
  const Botton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ((){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder:
           (context)=>MyCat()
           )
        );
      }),
                          
       child: 
       Text("ادامه",style: Theme.of(context).textTheme.headlineMedium));
  }
}



Future<void> myLaunchUrl(String url) async {
  var uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      developer.log("Could not launch ${uri.toString()}");
    }
    
  
}





  PreferredSize appBar(String title) {


    return PreferredSize(

      preferredSize: Size.fromHeight(80),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Center(child: Text(title,style: TextStyle(
                fontSize: 16,fontWeight: FontWeight.w300,fontFamily:'dana',color:
                Colors.black),)),
            )
            
          ],
          leading: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(color: SolidColors.primaryColor,
              shape: BoxShape.circle),
              child: Icon(Icons.keyboard_arrow_right,color: Colors.white,size: 40,),
            ),
          ),
        ),
      ),
    );
  }




class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCube(color: SolidColors.primaryColor,size: 35,);
  }
}
