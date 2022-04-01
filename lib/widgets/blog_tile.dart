import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_sentiment/dart_sentiment.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screen/news_info_screen.dart';
import 'package:news_app/screen/webwiew_artical.dart';
import 'package:share/share.dart';

class BlogTile extends StatefulWidget {
  final String imageUrl, title, desc, publishedAt, author, articleUrl, source;


  BlogTile(
      {required this.imageUrl,
      required this.title,
      required this.desc,
      required this.author,
      required this.publishedAt,
      required this.articleUrl,

      required this.source});

  @override
  _BlogTileState createState() => _BlogTileState();
}

class _BlogTileState extends State<BlogTile> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    var duration =
        DateTime.now().difference(DateTime.parse(widget.publishedAt));
    String time = (duration.inHours >= 1)
        ? duration.inHours.toString() + " hour ago"
        : duration.inMinutes.toString() + " minuit ago";
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    WebViewContainer(url: widget.articleUrl)));
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 0),
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.blue.shade900,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CachedNetworkImage(
                    width: double.infinity,
                    height: 200,
                    imageUrl: widget.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator(color: Colors.white70,)),
                    // errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      )),
                  Container(
                    padding: EdgeInsets.only(left: 12,right: 12,top: 5,bottom: 8),
                    child: Text(
                      widget.desc,
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.white),
                    ),
                  ),
                  Container(
                    height: 5,
                  ),
                  Container(
                    height: 1,
                    color: Colors.white24,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: widget.source == "null" ? 0 : 80,
                            child: Text(
                              widget.source == "null" ? "" : widget.source,
                              style: TextStyle(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            time,
                            style: TextStyle(color: Colors.white),
                          ),

                          IconButton(
                            icon: Icon(Icons.share),
                            onPressed: () {
                              Share.share(widget.articleUrl);
                            },
                            color: Colors.white,
                            tooltip: "Share",
                            splashColor: Colors.blue,
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



