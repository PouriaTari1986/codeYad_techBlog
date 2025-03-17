import 'package:get/get.dart';
import 'package:tech_blog/models/Article_Model.dart';
import 'package:tech_blog/models/poster_model.dart';
import 'package:tech_blog/models/tags_model.dart';
// ignore: unused_import
import 'package:tech_blog/constant/api_constant.dart';
import 'package:tech_blog/services/dio_services.dart';

class HomeScreenController extends GetxController {

late Rx<PosterModel> poster;
RxList <TagsModel> tagsList = RxList();
RxList <ArticleModel> topVisitedList = RxList();
RxList <PosterModel> topPodcasts = RxList();


@override
void onInit() {

    super.onInit();
    getHomeItems();
  }
 getHomeItems()async {

    var response = await DioServices().getMethod(ApiConstant.getHomeItems);

      if(response.statusCode==200){

        response.data["top_visited"].forEach((element){

          topVisitedList.add(ArticleModel.fromJson(element));

        });
      }

 }
  }


