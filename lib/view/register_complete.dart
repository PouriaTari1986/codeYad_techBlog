// ignore_for_file: depend_on_referenced_packages

// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_blog/component/My_Colors.dart';
import 'package:tech_blog/component/my_strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/component/my_Component.dart';

class MyCat extends StatefulWidget {
  const MyCat({super.key});

  @override
  State<MyCat> createState() => _MyCatState();
}

class _MyCatState extends State<MyCat> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 32),
                SvgPicture.asset(Assets.images.smile, height: 100),
                SizedBox(height: 25),
                Text(MyStrings.welcometextPage, style: textTheme.titleSmall),
                SizedBox(height: 25),

                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    hintText: "نام و نام خانودگی",
                    hintStyle: textTheme.titleSmall,
                  ),
                ),
                SizedBox(height: 32),
                Text(MyStrings.chooseCat, style: textTheme.titleSmall),
                SizedBox(height: 16),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 90,

                    child: GridView.builder(
                      physics: ClampingScrollPhysics(),
                      itemCount: tagList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 8,
                            childAspectRatio: 2.9,
                          ),

                      itemBuilder: ((context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                            
                              catList.add(
                                catList[index]
                              );
                              
                              
                            });
                          },

                          child: MainTags(textTheme: textTheme, index: index),
                        );
                      }),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                SvgPicture.asset(Assets.images.arrowDown, height: 45),
                  //Selected Cat
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,

                    child: GridView.builder(
                      physics: ClampingScrollPhysics(),
                      itemCount: catList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing:8,
                            childAspectRatio:2,
                          ),

                      itemBuilder: ((context, index) {
                        return Container(
                             height: 60,
                             decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(24)),
                                   color: SolidColors.surfaceColor
                               ),
                               child: SizedBox(
                                  width: MediaQuery.of(context).size.width/0.8,
                                  height: 25,
                                  child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                  children: [
                                    
                                  SizedBox(width: 6,),
            
                                  Text(
                                    catList[index].title,
                                     style: textTheme.titleSmall,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      
                                      catList.removeAt(index);
                                    });

                                  },
                                  
                                  child:
                                 Icon(CupertinoIcons.delete,color: Colors.grey,size: 20,)),
                             ],
                          ),
                        ),
                       ),
                      );
                      }),
                    ),
                  ),
                ),

                
                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}
