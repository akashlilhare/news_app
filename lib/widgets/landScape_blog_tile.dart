import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screen/webwiew_artical.dart';
import 'package:share/share.dart';

class LandScapeBlogTile extends StatefulWidget {
  final String? imageUrl, title, desc, publishedAt,author,articleUrl,source;

  LandScapeBlogTile({
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.author,
    required this.publishedAt,
    required this.articleUrl,
    required this.source
  });
  @override
  _LandScapeBlogTileState createState() => _LandScapeBlogTileState();
}

class _LandScapeBlogTileState extends State<LandScapeBlogTile> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    var duration =  DateTime.now().difference(DateTime.parse(widget.publishedAt!));
    String time =(duration.inHours >=1) ? duration.inHours.toString()+" hour ago":duration.inMinutes.toString()+" minuit ago";
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewContainer(url:  widget.articleUrl)));
      },
      child: Container(
        height: height*.4,

        width: double.infinity,
        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(12)
        ),
        padding: const EdgeInsets.only(top: 10, bottom: 10,left: 10,right: 10),
        child: Card( shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black,width: 2),
          borderRadius: BorderRadius.circular(20.0),
        ),
          elevation: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.blue[900],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CachedNetworkImage(
                          width: width *.4,
                          height: height*.4,
                          imageUrl: widget.imageUrl!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                          // errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                      Container(height:height*.4,width: 2,color: Colors.black,),
                      Container(height: height*.4,width: width*.557,
                      child:Column(
                        children: [

                        Container(
                              width: width*.557,
                                padding: EdgeInsets.only(right: 8,left: 8,top: 8),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8,left: 8,bottom: 8),
                                  child: Text(
                                    widget.title!,maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                )),

                          Container(
                              //    height: height*.2,
                                  width: width*.557,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:15.0,top: 5,right: 10),
                                    child: Text(
                                      widget.desc!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400, color: Colors.white),
                                     maxLines: 4, ),
                                  ),
                                ),

                        ],
                      ),),
                    ],
                  ),
                  Container(height: 2,color: Colors.black,),
                  Expanded(
                    // height: height*.15,
                    // width: double.infinity,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          Container(
                            width:widget.source =="null" ?0:150,
                            child: Text(
                              widget.source =="null"?"":widget.source!,
                              style: TextStyle(color: Colors.white,
                              ),
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
                          IconButton(icon: Icon(Icons.share),onPressed: (){
                            Share.share(widget.articleUrl!);
                          },color: Colors.white,tooltip: "Share",splashColor: Colors.blue,)
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
