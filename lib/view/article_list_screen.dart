// ignore_for_file: depend_on_referenced_packages


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/controller/artlicle_conteroller.dart';

// ignore: must_be_immutable
class ArticleListScreen extends StatelessWidget {
   ArticleListScreen({super.key});

   ArtlicleConteroller artlicleConteroller =  Get.put(ArtlicleConteroller());
  @override
  Widget build(BuildContext context) {


    return SafeArea(child:Scaffold(
      appBar: appBar("مقالات جدید"),



      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Obx(
            ()=> ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: artlicleConteroller.articleList.length ,
              itemBuilder: ((context,index){
                
                return 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width/3,
                        height: Get.height/6,
                        child: CachedNetworkImage(
                         imageUrl:artlicleConteroller.articleList[index].image!,                  
                         imageBuilder: (context, imageProvider) => 
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(image: imageProvider,fit: BoxFit.cover)
                            
                            ),
                          
                          ),
                          placeholder: (context, url) => Loading()
                         ,
                         errorWidget: (context, url, error) => Icon(Icons.image_not_supported_outlined,
                         size: 50,color: Colors.grey,
                         ),
                         ),
                      ),
                       SizedBox(width: 16,),
                       Column(  
                        mainAxisAlignment: MainAxisAlignment.start,                    
                        children: [
                          SizedBox(width: Get.width/2,
                            child: Text(artlicleConteroller.articleList[index].title!,
                            style: TextStyle(fontFamily: "dana",fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                            overflow: TextOverflow.ellipsis ,maxLines: 2,
                            ),
                          ),
                          SizedBox(height: 16,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                  
                              Text(artlicleConteroller.articleList[index].author!,
                              style: TextStyle(fontFamily: "dana",fontSize: 16,fontWeight: FontWeight.w300,
                              color: Colors.grey.withAlpha(150)
                              ),),
                                SizedBox(width: 20,),
                              Text(artlicleConteroller.articleList[index].view!+ "بازدید",style:
                                TextStyle(fontFamily: "dana",fontSize: 14,fontWeight: FontWeight.w300,
                                color: Colors.grey.withAlpha(150))
                              ,)
                            ],
                          )
                  
                        ],
                       )
                          
                          
                  ],),
                );
                  
            
            
              })
               ),
          ),
        ),
      ) ,
    )

    
     );


  }


}