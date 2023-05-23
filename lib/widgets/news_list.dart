import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:news_app/widgets/shimer_loader.dart';

import 'blog_tile.dart';
import 'landScape_blog_tile.dart';

class NewsList extends StatelessWidget {
  final List<Article> articles;
   bool isLoading;
  final Function onReload;
   NewsList({Key? key, required this.articles, required this.isLoading, required this.onReload}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    log(articles.length.toString() + "length");
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return isLoading ? ShimmerLoader():
      isPortrait
        ? RefreshIndicator(
        onRefresh: ()=>onReload(),
          child: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return BlogTile(
                imageUrl: articles[index].urlToImage,
                title: articles[index].title,
                desc: articles[index].description,
                publishedAt: articles[index].publshedAt,
                author: articles[index].author,
                articleUrl: articles[index].articleUrl,
                source: articles[index].source);
          }),
        )
        : GridView.builder(
      itemCount: articles.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, childAspectRatio: 3),
      itemBuilder: (BuildContext context, int index) {
        return LandScapeBlogTile(
            imageUrl: articles[index].urlToImage,
            title: articles[index].title,
            desc: articles[index].description,
            publishedAt: articles[index].publshedAt,
            author: articles[index].author,
            articleUrl: articles[index].articleUrl,
            source: articles[index].source);
      },
    );
  }
}


