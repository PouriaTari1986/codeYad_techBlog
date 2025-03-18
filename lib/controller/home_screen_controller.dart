import 'dart:developer';

import 'package:get/get.dart';
import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/models/articel_model.dart';
import 'package:tech_blog/models/podcast_model.dart';
import 'package:tech_blog/models/poster_model.dart';
import 'package:tech_blog/models/tags_model.dart';
import 'package:tech_blog/services/dio_services.dart';

class HomeScreenController extends GetxController{

 final Rx<PosterModel> poster = PosterModel().obs;
 RxList <TagsModel>tagList = RxList();
RxList <ArticleModel>  topVisitedList = RxList() ;
RxList <PodcastModel>topPodcast = RxList();

  RxBool loading = false.obs;




  

getHomeItems()async{

  loading.value = true;

var response = await DioServices().getMethod(ApiConstant.getHomeItems);

if(response.statusCode==200){


  response.data['top_visited'].forEach((element){

   topVisitedList.add(ArticleModel.fromJson(element));
  });

    response.data['top_podcasts'].forEach((element){

   topPodcast.add(PodcastModel.fromJson(element));
  });

      response.data['tags'].forEach((element){

   tagList.add(TagsModel.fromJson(element));
  });
  
  poster.value = PosterModel.fromJson(response.data["poster"]);
  

  loading.value = false;
}else{
  log("message");
}
 

}
}
