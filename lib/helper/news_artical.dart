import 'dart:developer';

import 'package:dart_sentiment/dart_sentiment.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/artical_model.dart';
import 'dart:convert';
import '../helper/key_helper.dart';

class News {

  final sentiment = Sentiment();
  KeyHelper keyHelper = KeyHelper();
  List<Article> news  = [];
  List<Article> positiveNews = [];
  List<Article> negativeNews = [];


  Future<bool> getNews(String url) async{

    var response = await http.get(Uri.parse(url) );

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        print(element);
        if(element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
            title: element['title'] ??"",
            author: element['author']??"",
            description: element['description'] ??"",
            urlToImage: element['urlToImage']??"",
            publshedAt: element['publishedAt']??"",
            content: element["content"]??"",
            articleUrl: element["url"]??"",
            source: element["source"]["name"] ?? "",
          );
          news.add(article);

        }
      });
      categoriesNews();
      return true;
    }else{
      return false;
    }
  }

  void categoriesNews(){
    news.forEach((element) {
      var newsSentiment = sentiment.analysis(element.description);
      log(newsSentiment.toString());
      bool isPositive = newsSentiment["comparative"] >=0.0;

      if(isPositive){
        positiveNews.add(element);
      }else{
        negativeNews.add(element);
      }
    });


  }
}

