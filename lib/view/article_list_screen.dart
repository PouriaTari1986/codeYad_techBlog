// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/my_component.dart' show appBar;
import 'package:tech_blog/controller/artlicle_conteroller.dart';

// ignore: must_be_immutable
class ArticleListScreen extends StatelessWidget {
   ArticleListScreen({super.key});

   ArtlicleConteroller artlicleConteroller =  Get.put(ArtlicleConteroller());

  @override
  Widget build(BuildContext context) {


    return SafeArea(child:Scaffold(
      appBar: appBar("مقالات جدید"),



      body: SizedBox(
        child: Obx(
          ()=> ListView.builder(
            itemCount: artlicleConteroller.articleList.length ,
            itemBuilder: ((context,index){
          
              return Text(
                artlicleConteroller.articleList[index].title!
              );
          
            })
             ),
        ),
      ) ,
    )

    
     );


  }


}