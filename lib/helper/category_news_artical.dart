

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/artical_model.dart';

import 'key_helper.dart';

class CategoryNews {

  KeyHelper keyHelper = KeyHelper();
  List<Article> categoryNews  = [];

  Future<void> getNews(String category) async{
    print(category);

    String url = "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=${keyHelper.apiId}";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    print(response.statusCode);
    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

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
          categoryNews.add(article);
        }

      });
    }
  }
}