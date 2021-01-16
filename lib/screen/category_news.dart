import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/key_helper.dart';
import 'package:news_app/helper/news_artical.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:news_app/models/categori_model.dart';
import 'package:news_app/widgets/blog_tile.dart';
import 'package:news_app/widgets/category_title.dart';

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
    String url = "http://newsapi.org/v2/top-headlines?country=in&category=${widget.category}&apiKey=${keyHelper.apiId}";
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
          : Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [

              Expanded(
                //     height: 600,
                child: ListView.builder(
                    physics: ClampingScrollPhysics(),
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
                    }),
              )
            ],
          )),
    );
  }
}

