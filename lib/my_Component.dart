// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:tech_blog/view/register_complete.dart';
import 'My_Colors.dart';
import "models/fake_data.dart";



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
                tagList[index].title,
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