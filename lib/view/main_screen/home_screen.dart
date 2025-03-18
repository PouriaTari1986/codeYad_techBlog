// ignore_for_file: depend_on_referenced_packages, unnecessary_import, sort_child_properties_last

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/component/my_strings.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';

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
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child:
              homeScreenController.loading.value == false
                  ? Column(
                    children: [
                      //poster
                      poster(),
                      SizedBox(height: 16,),
                      tags(),
                      SizedBox(height: 16,),
                      SeeMoreBlog(),
                      SizedBox(height: 8,),
                      topVisited(),
                      SizedBox(height: 16,),
                     SeeMorePodCast(),
                     SizedBox(height: 8,), 
                      topPodcast(),
                    ],
                  )
                  : Center(child: Loading()),
        ),
      ),
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: size.height / 4.3,
      child: ListView.builder(
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
                            child: CachedNetworkImage(
                              imageUrl:
                                  homeScreenController
                                      .topVisitedList[index]
                                      .image!,
                              imageBuilder:
                                  (context, imageProvider) => Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                      image: DecorationImage(
                                        image: imageProvider,
                                      ),
                                    ),
                                  ),

                              placeholder: (context, url) => Loading(),
                              errorWidget:
                                  (context, url, error) => Icon(
                                    Icons.image_not_supported_outlined,
                                    size: 50,
                                    color: Colors.grey,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      homeScreenController
                                          .topVisitedList[index]
                                          .author!,
                                      style: textTheme.titleLarge,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      homeScreenController
                                          .topVisitedList[index]
                                          .view!,
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
                      width: size.width / 2.6,
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
    );
  }

  Widget topPodcast() {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
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
                    child: CachedNetworkImage(
                      imageUrl: homeScreenController.topPodcast[index].poster!,
                      imageBuilder:
                          (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      placeholder: (context, url) => Loading(),
                      errorWidget:
                          (context, url, error) => Icon(
                            Icons.image_not_supported_outlined,
                            size: 55,
                            color: Colors.grey,
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
    );
  }

  Widget poster() {
    return Stack(
      children: [
        Container(
          width: size.width / 1.19,
          height: size.height / 4.2,
          child: CachedNetworkImage(
            imageUrl: homeScreenController.poster.value.image ?? "no image",
            imageBuilder:
                (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            placeholder: (context, url) => Loading(),
            errorWidget:
                (context, url, error) => Icon(
                  Icons.image_not_supported_outlined,
                  size: 50,
                  color: Colors.grey,
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Text(
              //       homePagePosterMap["writer"] +
              //           // ignore: prefer_interpolation_to_compose_strings
              //           " - " +
              //           homePagePosterMap["date"],

              //       style: textTheme.titleLarge,
              //     ),
              //     Row(
              //       children: [
              //         Text(
              //           homePagePosterMap["view"],
              //           style: textTheme.titleLarge,
              //         ),
              //         SizedBox(width: 8),
              //         Icon(
              //           CupertinoIcons.eye_fill,
              //           size: 16,
              //           color: Colors.white,
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              // SizedBox(height: 8),
              Text(
                homeScreenController.poster.value.title ?? "no title",
                style: textTheme.headlineLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget tags() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homeScreenController.tagList.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(8, 8, index == 0 ? bodyMargin : 8, 8),
            child: MainTags(textTheme: textTheme, index: index),
          );
        }),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget SeeMoreBlog() {
    return Padding(
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
    );
  }

// ignore: non_constant_identifier_names
Widget SeeMorePodCast(){

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

