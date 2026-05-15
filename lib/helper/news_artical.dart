import 'dart:convert';
import 'dart:developer';

import 'package:dart_sentiment/dart_sentiment.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/artical_model.dart';

import '../helper/key_helper.dart';

class News {
  final sentiment = Sentiment();
  KeyHelper keyHelper = KeyHelper();
  List<Article> news = [];
  List<Article> positiveNews = [];
  List<Article> negativeNews = [];

  Future<bool> getNews(String url) async {
    news.clear();
    positiveNews.clear();
    negativeNews.clear();

    if (!keyHelper.hasApiKey) {
      log('NEWS_API_KEY was not provided. Pass --dart-define=NEWS_API_KEY=your_key when running the app.');
      return false;
    }

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode < 200 || response.statusCode >= 300) {
        log('News API request failed with status ${response.statusCode}: ${response.body}');
        return false;
      }

      final jsonData = jsonDecode(response.body);
      if (jsonData is! Map<String, dynamic> || jsonData['status'] != 'ok') {
        log('News API returned an error response: $jsonData');
        return false;
      }

      final articles = jsonData['articles'];
      if (articles is! List) {
        log('News API response did not contain an articles list.');
        return false;
      }

      for (final element in articles) {
        if (element is! Map<String, dynamic>) {
          continue;
        }

        final imageUrl = element['urlToImage'];
        final description = element['description'];
        final source = element['source'];
        if (imageUrl is String &&
            imageUrl.isNotEmpty &&
            description is String &&
            description.isNotEmpty) {
          final article = Article(
            title: element['title']?.toString() ?? '',
            author: element['author']?.toString() ?? '',
            description: description,
            urlToImage: imageUrl,
            publshedAt: element['publishedAt']?.toString() ?? '',
            content: element['content']?.toString() ?? '',
            articleUrl: element['url']?.toString() ?? '',
            source: source is Map<String, dynamic>
                ? source['name']?.toString() ?? ''
                : '',
          );
          news.add(article);
        }
      }
      categoriesNews();
      return true;
    } catch (error, stackTrace) {
      log('Failed to load news.', error: error, stackTrace: stackTrace);
      return false;
    }
  }

  void categoriesNews() {
    positiveNews.clear();
    negativeNews.clear();

    news.forEach((element) {
      var newsSentiment = sentiment.analysis(element.description);
      bool isPositive = newsSentiment['comparative'] >= 0.0;

      if (isPositive) {
        positiveNews.add(element);
      } else {
        negativeNews.add(element);
      }
    });
  }
}
