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
import 'package:news_app/widgets/news_list.dart';

import 'category_news.dart';
import 'drawer_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  List<CategoryModel> categories = [];
  List<CategoryModel> drawerCategories = [];
  List<Article> articles = [];
  List<Article> positiveArticles = [];
  List<Article> negativeArticles = [];
  News newsClass = News();
  KeyHelper keyHelper = KeyHelper();
  bool _loading = true;
  bool liked = false;

  ScrollController? _scrollController;
  TabController? tabContoller;

  @override
  void initState() {
    _scrollController = new ScrollController();
    tabContoller = new TabController(
      vsync: this,
      length: 3,
    );
    super.initState();
    categories = getCategories();
    drawerCategories = getDrawerCategories();
    getNews();
  }

  getNews() async {
    setState(() {
      _loading = true;
    });
    newsClass.news = [];
    newsClass.negativeNews = [];
    newsClass.positiveNews = [];
    articles = [];
    positiveArticles = [];
    negativeArticles = [];
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=${keyHelper.apiId}";
    await newsClass.getNews(url);
    articles = newsClass.news;
    positiveArticles = newsClass.positiveNews;
    negativeArticles = newsClass.negativeNews;
    setState(() {
      _loading = false;
    });
  }

  List<String> categoriesName = [
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology"
  ];

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var size = MediaQuery.of(context).size;
    double height = size.height;
    // double width = size.width;
    return Scaffold(

      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: DrawerScreen(
            titleList:drawerCategories,
          ),
          appBar: AppBar(
            title: Text("News App"),
            bottom: TabBar(        physics: NeverScrollableScrollPhysics(),

              tabs: [
                Tab( text: "All"),
                Tab( text: "Positive"),
                Tab(text: "Negative")
              ],
              controller: tabContoller,
              onTap: (_){

               setState(() {
                 _loading = true;
                });
                Future.delayed(Duration(seconds: 2)).then((value) {
                  setState(() {
                    _loading = false;
                  });
                });
              },
            ),
          ),
          body: TabBarView(
            children: [
             NewsList(articles: articles, isLoading: _loading,onReload: getNews),
             NewsList(articles: positiveArticles, isLoading: _loading,onReload: getNews),
             NewsList(articles: negativeArticles, isLoading: _loading,onReload: getNews),
            ],
          ),
        ),
      ),

    );
  }
}
