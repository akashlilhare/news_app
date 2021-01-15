import 'package:flutter/material.dart';
import 'package:news_app/screen/webwiew_artical.dart';

class BlogTile extends StatefulWidget {
  final String imageUrl, title, desc, publishedAt,author,articleUrl,source;

  BlogTile({
    @required this.imageUrl,
    @required this.title,
    @required this.desc,
    @required this.author,
    @required this.publishedAt,
    @required this.articleUrl,
    @required this.source
  });

  @override
  _BlogTileState createState() => _BlogTileState();
}

class _BlogTileState extends State<BlogTile> {
  bool liked = false;


  @override
  Widget build(BuildContext context) {
    var duration =  DateTime.now().difference(DateTime.parse(widget.publishedAt));
    String time =(duration.inHours >=1) ? duration.inHours.toString()+" hour ago":duration.inMinutes.toString()+" minuit ago";
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleView(blogUrl: widget.articleUrl)));
      },
      child: Container(

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

                  Container(color: Colors.black54,height: 10,),

Container(color: Colors.black,height: .5,),
                  Container(
                   color: Colors.black54,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          Container(
                            width:widget.source =="null" ?0:80,
                            child: Text(
                              widget.source =="null"?"":widget.source,
                              style: TextStyle(color: Colors.white),
                              overflow: TextOverflow.ellipsis,),
                          ),

                          Text(
                            time,
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
      ),
    );
  }
}
