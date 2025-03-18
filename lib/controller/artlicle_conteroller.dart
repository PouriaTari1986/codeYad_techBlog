 
import 'package:get/get.dart';
import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/models/articel_model.dart';
import 'package:tech_blog/services/dio_services.dart';




class ArtlicleConteroller extends GetxController {

  RxList <ArticleModel> articleList =RxList();

    RxBool loading = false.obs;

@override
 void onInit() {
    super.onInit();
    getList();
  }


  

getList()async{

  loading.value = true;


var response = await DioServices().getMethod(ApiConstant.getHomeArticleList);

if(response.statusCode==200){


  response.data.forEach((element){

   articleList.add(ArticleModel.fromJson(element));
  });


  loading.value = false;
}
}
 
}
