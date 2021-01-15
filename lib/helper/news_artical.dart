import 'package:http/http.dart' as http;
import 'package:news_app/models/artical_model.dart';
import 'dart:convert';
import '../helper/key_helper.dart';

class News {

  KeyHelper keyHelper = KeyHelper();
  List<Article> news  = [];

  Future<void> getNews() async{

    String url = "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=${keyHelper.apiId}";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

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

class CategoryNews {

  KeyHelper keyHelper = KeyHelper();
  List<Article> news  = [];

  Future<void> getNews(String category) async{
    print(category);
String url = "https://newsapi.org/v2/top-headlines?country=in&${keyHelper.apiId}";
  //  String url = "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=${keyHelper.apiId}";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

print(response.statusCode);
    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
            title: element['title'],
            author: element['author'],
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