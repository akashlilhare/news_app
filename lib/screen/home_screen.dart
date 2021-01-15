import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news_artical.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:news_app/models/categori_model.dart';
import 'package:news_app/widgets/blog_tile.dart';
import 'package:news_app/widgets/category_title.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<Article> articles = [];
  News newsClass = News();
  bool _loading = true;
  bool liked = false;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  onTap() {
    setState(() {
      liked = !liked;
    });
  }

  getNews() async {
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("News",style: TextStyle(color: Colors.blue.shade900)),
            Text(
              "Now",
              style: TextStyle(color: Colors.green),
            ),
          ],
        ),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Container(
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            categoryName: categories[index].categoryName,
                            imageUrl: categories[index].imageAssetUrl,
                          );
                        },
                      )),
                  Expanded(
                    //     height: 600,
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return BlogTile(
                              imageUrl: articles[index].urlToImage,
                              title: articles[index].title,
                              desc: articles[index].description,
                              publishedAt: articles[index].publshedAt,
                            author: articles[index].author,
                            articleUrl : articles[index].articleUrl,
                            source: articles[index].source
                          );
                        }),
                  )
                ],
              )),
    );
  }
}

