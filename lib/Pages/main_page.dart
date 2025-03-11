import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/My_Colors.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width/10;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(CupertinoIcons.search),

                  Assets.images.logo.image(height: size.height / 13.6),

                  Icon(CupertinoIcons.line_horizontal_3),
                ],
              ),
              SizedBox(height: 8),
              Stack(
                children: [
                  Container(
                    width: size.width / 1.19,
                    height: size.height / 4.20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      image: DecorationImage(
                        image: AssetImage(homePagePosterMap["imageUrl"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      gradient: LinearGradient(
                        colors: gradiantColors.homePosterGraviant,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 8,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [

                                Icon(CupertinoIcons.eye_fill,size: 16,color: Colors.white,),
                                SizedBox(width: 8,),
                                Text(homePagePosterMap["view"], style: textTheme.titleLarge),
                                
                              ],
                            ),
                        
                            Text(
                              homePagePosterMap["writer"]+" - "+homePagePosterMap["date"],
                              style: textTheme.titleLarge,
                            ),
                          ],
                        ), 
                        SizedBox(
                          height: 8,
                        ),
                        Text(homePagePosterMap["title"],style: textTheme.headlineLarge,)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16,),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tagList.length,
                  itemBuilder:((context,index){
                    
                    return Padding(
                      padding:  EdgeInsets.fromLTRB(0, 8, index==6?bodyMargin:15, 8),
                      child: Container(
                        
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          gradient: LinearGradient(colors: gradiantColors.hashtagBg,
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft),
                          
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 10, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                          
                              Text(tagList[index].title,
                              style: textTheme.headlineMedium),
                                SizedBox(width: 8,),
                              Assets.images.hashtag.image(height: 16)
                            ],
                          ),
                        )
                      ),
                    );
                  })
                  
                   ),
              )
            ],
          ),
      
        ),
      ),
    );
  }
}
