import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news_artical.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:news_app/models/categori_model.dart';
import 'package:news_app/widgets/category_title.dart';
import 'package:intl/intl.dart';


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
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("News"),
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
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return BlogTile(
                              imageUrl: articles[index].urlToImage,
                              title: articles[index].title,
                              desc: articles[index].description,
                              publishedAt: articles[index].publshedAt,
                            author: articles[index].author
                          );
                        }),
                  )
                ],
              )),
    );
  }
}

class BlogTile extends StatefulWidget {
  final String imageUrl, title, desc, publishedAt,author;

  BlogTile({
    @required this.imageUrl,
    @required this.title,
    @required this.desc,
    @required this.author,
    @required this.publishedAt,
  });

  @override
  _BlogTileState createState() => _BlogTileState();
}

class _BlogTileState extends State<BlogTile> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(

       borderRadius: BorderRadius.circular(12)
      ),
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Card( shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
        elevation: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                  ),
               //   height: 450,
                  width: double.infinity,
                ),
                Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.black54,
                    child: Text(
                      widget.title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )),
                Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.black54,
                  child: Text(
                    widget.desc,
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.white),
                  ),
                ),
                Container(
                  color: Colors.black54,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                //        (widget.author!=null)  ??  Text(widget.author),
                        Text(
                          DateTime.now().difference(DateTime.parse(widget.publishedAt)).inHours.toString()+" hour ago ",
                        style: TextStyle(color: Colors.white),),


                        IconButton(tooltip: "Like",
                            icon: Icon(Icons.favorite,
                                color: liked ? Colors.red : Colors.white),
                            onPressed: () {
                              setState(() {
                                liked = !liked;
                                print(liked);
                              });
                            }),
                        IconButton(icon: Icon(Icons.share),onPressed: (){},color: Colors.white,tooltip: "Share",splashColor: Colors.blue,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
