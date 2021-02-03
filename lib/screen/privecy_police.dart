import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screen/webwiew_artical.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivecyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var style = TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w400);
    return Scaffold(
      appBar: AppBar(title: Text("About In-News"),),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Text("In - News uses news api as news source\n",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8,top:8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.black54,
                  ),SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebViewContainer(
                                url: "https://newsapi.org/sources",
                              )));
                    },
                    child: Text(
                      "Source of news",
                      style: style,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8,top:8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.black54,
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebViewContainer(
                                url:"https://newsapi.org/privacy" ,
                              )));
                    },
                    child: Text(
                      "Privacy Policy",
                      style: style,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
