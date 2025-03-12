import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/My_Colors.dart';
import 'package:tech_blog/My_Strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import '../models/fake_data.dart';




class HomeScreen extends StatelessWidget {
  const HomeScreen({
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
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: Column(
        
        children: [
          
        //poster
          HomePagePoster(size: size, textTheme: textTheme),
          
         
          HomePageTagList(),
          SizedBox(
            height: 60,
            child: AspectRatio(aspectRatio: 16/9,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tagList.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                      index == 0 ? bodyMargin : 15,
                      8,
                      index == tagList.length - 1 ? bodyMargin : 0,
                      8,
                    ),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        gradient: LinearGradient(
                          colors: GradiantColors.hashtagBg,
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 10, 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              tagList[index].title,
                              style: textTheme.headlineMedium,
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.tag, color: Colors.white, size: 18),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
    
          SeeMoreBlog(),
          Padding(
            padding: EdgeInsets.only(right: bodyMargin, top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  MyStrings.viewHotestBlog,
                  style: textTheme.titleMedium,
                ),
                SizedBox(width: 8),
                Assets.images.bluePen.image(
                  color: SolidColors.colorTitle,
                  height: size.height / 37,
                ),
              ],
            ),
          ),
    
          HomePageBlogList(size: size, bodyMargin: bodyMargin, textTheme: textTheme),
         
          SeeMorePodCast(bodyMargin: bodyMargin, textTheme: textTheme, size: size),
    
          PodCastList(size: size, bodyMargin: bodyMargin)
        ]
      ),
    ),
              );
  }
}

class PodCastList extends StatelessWidget {
  const PodCastList({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child:
       ListView.builder(
                 itemCount: blogList.getRange(0, 5).length,
                 scrollDirection: Axis.horizontal,
                 itemBuilder: (contex, index) {
                   return Column(
                     children: [
       Padding(
         padding: EdgeInsets.only(
           right:
               index == blogList.getRange(0, 5).length - 1
                   ? bodyMargin
                   : 15,
           top: 12,
           left: index == 0 ? bodyMargin : 15,
         ),
         child: SizedBox(
               height: size.height / 5.3,
               width: size.width / 2.6,                        
           child: Container(
                                           
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(16),
               image: DecorationImage(
                 image: NetworkImage(blogList[index].imageUrl!),
                     
               ),
             ),
           )
         )
       )
                     ]
                   );
                 }
                      )
    );
  }
}

class SeeMorePodCast extends StatelessWidget {
  const SeeMorePodCast({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
    required this.size,
  });

  final double bodyMargin;
  final TextTheme textTheme;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, top: 12),
      child: Row(                        
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            MyStrings.viewHotestPodCast,
            style: textTheme.titleMedium,
          ),
          SizedBox(width: 8),
          Assets.images.mic.image(
            color: SolidColors.colorTitle,
            height: size.height / 37,
          ),
        ],
      ),
    );
  }
}

class HomePageBlogList extends StatelessWidget {
  const HomePageBlogList({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder( 
        
        itemCount: blogList.getRange(0, 5).length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (contex, index) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(               
                  top: 12,
                  left: index == 0 ? bodyMargin : 15,
                ),
                child: SizedBox(
                      height: size.height / 5.3,
                      width: size.width / 2.6,                        
                  child: Stack(
                    children: [
                      Container(
                  
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: NetworkImage(blogList[index].imageUrl!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        foregroundDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: GradiantColors.blogPost,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 0,
                        left: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.eye_fill,
                                  size: 16,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  blogList[index].views!,
                                  style: textTheme.titleLarge,
                                ),
                              ],
                            ),
                  
                            Text(
                              blogList[index].writer!,
                              style: textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 12,
                  left: index == 0 ? bodyMargin : 15,),
                child: SizedBox(
                  width: size.width/2.4,
                  child: Text(blogList[index].title!,textDirection: TextDirection.rtl,
                  style: textTheme.titleSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  )),
              )
            ],
          );
        },
      ),
     );
    
  }
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 32);
  }
}

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 16);
  }
}

class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.19,
          height: size.height / 4.2,
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
              colors: GradiantColors.homePosterGraviant,
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
                      Icon(
                        CupertinoIcons.eye_fill,
                        size: 16,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        homePagePosterMap["view"],
                        style: textTheme.titleLarge,
                      ),
                    ],
                  ),
    
                  Text(
                    homePagePosterMap["writer"] +
                        // ignore: prefer_interpolation_to_compose_strings
                        " - " +
                        homePagePosterMap["date"],
                    style: textTheme.titleLarge,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                homePagePosterMap["title"],
                style: textTheme.headlineLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
