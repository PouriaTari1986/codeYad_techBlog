// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:tech_blog/component/My_Colors.dart';
import 'package:tech_blog/component/my_component.dart' show appBar;

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return SafeArea(child:Scaffold(
      appBar: appBar("مقالات جدید"),
    )

    
     );


  }


}