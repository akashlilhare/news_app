import 'package:flutter/material.dart';
import 'package:dart_sentiment/dart_sentiment.dart';
class NewsInfoScreen extends StatelessWidget {
  final String title;
  const NewsInfoScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sentiment = Sentiment();
    buildTile(String title, String subTitle) {
      return ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
      );
    }
    buildContent(){
      Map<String,dynamic> res = sentiment.analysis(title,emoji: true);
   return  Column(
     children: [
       buildTile("score", res["score"].toString(),),
       buildTile("comparative", res["comparative"].toString(),),
       buildTile("words", res["tokens"].toString(),),
       buildTile("Good words", res["positive"].toString(),),
       buildTile("Bad words", res["negative"].toString(),),

     ],
   );
   }


    return Scaffold(
      appBar: AppBar(title: Text("Info"),),
      body: Column(
        children: [
         Container(child: Text(sentiment.analysis(title,emoji: true).toString()),),
          buildContent()
        ],
      ),
    );
  }
}
