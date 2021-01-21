import 'package:http/http.dart' as http;
import 'package:news_app/models/artical_model.dart';
import 'dart:convert';
import '../helper/key_helper.dart';

class News {

  KeyHelper keyHelper = KeyHelper();
  List<Article> news  = [];

  Future<void> getNews(String url) async{

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);
print(jsonData);
    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
            source: element['source']['name'],
            title: element['title'],
            author: element['author'] == null ? "null":element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: element['publishedAt'],
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }

      });
    }
  }
}

