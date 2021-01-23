import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/key_helper.dart';
import 'package:news_app/helper/news_artical.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:news_app/models/categori_model.dart';
import 'package:news_app/widgets/blog_tile.dart';
import 'package:news_app/widgets/landScape_blog_tile.dart';

class CategoryNewsScreen extends StatefulWidget {
  final String category;
  CategoryNewsScreen({@required this.category});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<CategoryNewsScreen> {
  List<CategoryModel> categories = [];
  List<Article> articles = [];
  News newsClass = News();
  KeyHelper keyHelper = KeyHelper();
  bool _loading = true;
  bool liked = false;

  @override
  void initState() {
    // print(categories[widget.index]);

    super.initState();
    categories = getCategories();
    getCategoryNews();
  }

  getCategoryNews() async {
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=${widget.category}&apiKey=${keyHelper.apiId}";
    // String url = "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=${keyHelper.apiId}";


    print(url);
    // await newsClass.getNews();
    await newsClass.getNews(url);
    print("in async block");

    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("News",style: TextStyle(color: Colors.blue.shade700),),
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
          :isPortrait?
      ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return BlogTile(
                  source: articles[index].source,
                  imageUrl: articles[index].urlToImage,
                  title: articles[index].title,
                  desc: articles[index].description,
                  publishedAt: articles[index].publshedAt,
                  author: articles[index].author,
                  articleUrl : articles[index].articleUrl,

                );
              }):GridView.builder(
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
    )
    );
  }
}