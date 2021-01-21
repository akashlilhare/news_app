import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/key_helper.dart';
import 'package:news_app/helper/news_artical.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:news_app/models/categori_model.dart';
import 'package:news_app/widgets/blog_tile.dart';
import 'package:news_app/widgets/category_title.dart';
import 'package:news_app/widgets/landScape_blog_tile.dart';

import 'category_news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  List<CategoryModel> categories = [];
  List<Article> articles = [];
  News newsClass = News();
  KeyHelper keyHelper = KeyHelper();
  bool _loading = true;
  bool liked = false;

  ScrollController _scrollController;
  TabController tabContoller;

  @override
  void initState() {
    _scrollController = new ScrollController();
    tabContoller = new TabController(
      vsync: this,
      length: 1,
    );
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=${keyHelper.apiId}";
    await newsClass.getNews(url);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  List<String> categoriesName = [
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology"
  ];

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var size = MediaQuery.of(context).size;
    double height = size.height;
    // double width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("News", style: TextStyle(color: Colors.blue.shade900)),
                  Text(
                    "Now",
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
              //collapsedHeight: 55,
              titleSpacing: 010,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              expandedHeight: isPortrait ? height * .18 : height * .3,
              pinned: true,
              floating: false,
              forceElevated: innerBoxIsScrolled,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(children: <Widget>[
                  Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 60, right: 10, left: 10),
                        child: Container(
                            height: isPortrait ? height * .08 : height * .12,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: categories.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    print(categoriesName[index]);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CategoryNewsScreen(
                                                  category:
                                                      categoriesName[index],
                                                )));
                                  },
                                  child: CategoryTile(
                                    categoryName:
                                        categories[index].categoryName,
                                    imageUrl: categories[index].imageAssetUrl,
                                  ),
                                );
                              },
                            )),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ];
        },
        body: _loading
            ? Center(child: CircularProgressIndicator())
            : TabBarView(
                controller: tabContoller,
                children: [
                  isPortrait
                      ? ListView.builder(
                          physics: ClampingScrollPhysics(),
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
                          })
                      : GridView.builder(
                          itemCount: articles.length,
                          gridDelegate:
                              new SliverGridDelegateWithFixedCrossAxisCount(
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
                        ),
                ],
              ),
      )),
    );
  }
}
