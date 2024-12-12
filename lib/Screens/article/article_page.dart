import 'package:app_trac_nghiem/Screens/article/widget/article_box_content.dart';
import 'package:app_trac_nghiem/Screens/article/widget/article_loading.dart';
import 'package:app_trac_nghiem/Screens/article/widget/article_title.dart';
import 'package:app_trac_nghiem/Widget/background_custom.dart';
import 'package:app_trac_nghiem/apps/utils/constants.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  int idTopic;
  String name;
  ArticlePage({super.key, required this.idTopic, required this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundCustom(),
          Positioned.fill(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: paddingCustom(context),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ArticleTitle(name: name),
                      SizedBox(height: getHeight(context) * 0.04),
                      const ArticleLoading(),
                      SizedBox(height: getHeight(context) * 0.04),
                      ArticleBoxContent(
                        idTopic: idTopic,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
