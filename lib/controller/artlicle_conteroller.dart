 
// import 'package:get/get.dart';
// import 'package:tech_blog/component/api_constant.dart';
// import 'package:tech_blog/models/articel_model.dart';
// import 'package:tech_blog/services/dio_services.dart';




// class ArtlicleConteroller extends GetxController {

//   RxList <ArticleModel> articleList =RxList();

//     RxBool loading = false.obs;

// @override
//  void onInit() {
//     super.onInit();
//     getList();
//   }


  

// getList()async{




//   loading.value = true;


// var response = await DioServices().getMethod(ApiConstant.getHomeArticleList);

// if(response.statusCode==200){



//   response.data.forEach((element){

//    articleList.add(ArticleModel.fromJson(element));
//   });


  
// }

// }

// }
 import 'package:get/get.dart';
import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/models/articel_model.dart';
import 'package:tech_blog/services/dio_services.dart';

class ArticleController extends GetxController {
  // RxList to store articles
  RxList<ArticleModel> articleList = RxList();

  // RxBool to track loading state
  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getList(); // Fetch articles when the controller is initialized
  }

  // Method to fetch articles
  Future<void> getList() async {
    try {
      // Set loading to true
      loading.value = true;

      // Make the API call
      var response = await DioServices().getMethod(ApiConstant.getHomeArticleList);

      // Check if the response is successful
      if (response.statusCode == 200) {
        // Ensure response.data is a List
        if (response.data is List) {
          // Clear the list before adding new items
          articleList.clear();

          // Parse each item in the list and add to articleList
          final List<ArticleModel> articles = (response.data as List)
              .map((element) => ArticleModel.fromJson(element))
              .toList();

          // Update the RxList using assignAll
          articleList.assignAll(articles);
        } else {
          print('Error: Expected a list but got ${response.data.runtimeType}');
        }
      } else {
        print('Error: Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      // Set loading to false
      loading.value = false;
    }
  }
}
