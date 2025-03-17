// ignore_for_file: depend_on_referenced_packages, unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tech_blog/component/My_Colors.dart';
import 'package:tech_blog/component/My_Strings.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import '../models/fake_data.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
   HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });
  
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  
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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tagList.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                      8,
                      8,
                      index == 0 ? bodyMargin : 8,
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
                            Icon(Icons.tag, color: Colors.white, size: 18),
                            SizedBox(width: 8),
                            Text(
                              tagList[index].title,
                              style: textTheme.headlineMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            SeeMoreBlog(),
            Padding(
              padding: EdgeInsets.only(right: bodyMargin, top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Assets.images.bluePen.image(
                    color: SolidColors.colorTitle,
                    height: size.height / 37,
                  ),
                  SizedBox(width: 8),

                  Text(MyStrings.viewHotestBlog, style: textTheme.titleMedium),
                ],
              ),
            ),

           topVisited(),
            SeeMorePodCast(
              bodyMargin: bodyMargin,
              textTheme: textTheme,
              size: size,
            ),

            topPodcast()
          ],
        ),
      ),
    );
  }
Widget topVisited(){

  return SizedBox(
      height: size.height / 4.3,
      child: Obx(
        ()=> ListView.builder(
          itemCount: homeScreenController.topVisitedList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder:
              (contex, index) => SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 12,
                        right: index == 0 ? bodyMargin : 15,
                      ),
                      child: SizedBox(
                        height: size.height / 7,
                        width: size.width / 2.6,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  image: NetworkImage(
                                  homeScreenController.topVisitedList[index].image!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              foregroundDecoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(16)),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                       homeScreenController.topVisitedList[index].author!,
                                        style: textTheme.titleLarge,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        homeScreenController.topVisitedList[index].view!,
                                        style: textTheme.titleLarge,
                                      ),
                                      SizedBox(width: 8),
                                      Icon(
                                        CupertinoIcons.eye_fill,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                    ],
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
                        right: index == 0 ? bodyMargin : 15,
                      ),
                      child: SizedBox(
                        width: size.width/2.6
                        ,
                        child: Text(
                         homeScreenController.topVisitedList[index].title!,
                          textDirection: TextDirection.rtl,
                          style: textTheme.titleSmall,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
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


Widget topPodcast(){
  return

  SizedBox(
      height: size.height / 3.5,
      child: Obx(
        ()=> ListView.builder(
          itemCount: homeScreenController.topPodcast.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (contex, index) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      8,
                      8,
                      index == 0 ? bodyMargin : 8,
                      8,
                    ),
                    child: SizedBox(
                      height: size.height / 5.3,
                      width: size.width / 2.6,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: NetworkImage(
                             homeScreenController.topPodcast[index].poster!
                              ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 12,
                      right: index == 0 ? bodyMargin : 15,
                    ),
                    child: SizedBox(
                      width: size.width / 2.4,
                      child: Text(
                       homeScreenController.topPodcast[index].title!,
                        textDirection: TextDirection.rtl,
                        style: textTheme.titleSmall,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Assets.images.mic.image(
            color: SolidColors.colorTitle,
            height: size.height / 37,
          ),
          SizedBox(width: 8),
          Text(MyStrings.viewHotestPodCast, style: textTheme.titleMedium),
        ],
      ),
    );
  }
}



class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 32);
  }
}

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({super.key});

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
                  Text(
                    homePagePosterMap["writer"] +
                        // ignore: prefer_interpolation_to_compose_strings
                        " - " +
                        homePagePosterMap["date"],

                    style: textTheme.titleLarge,
                  ),
                  Row(
                    children: [
                      Text(
                        homePagePosterMap["view"],
                        style: textTheme.titleLarge,
                      ),
                      SizedBox(width: 8),
                      Icon(
                        CupertinoIcons.eye_fill,
                        size: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(homePagePosterMap["title"], style: textTheme.headlineLarge),
            ],
          ),
        ),
      ],
    );
  }
}


  



