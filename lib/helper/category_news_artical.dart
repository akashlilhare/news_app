import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:news_app/models/artical_model.dart';

import 'key_helper.dart';

class CategoryNews {
  KeyHelper keyHelper = KeyHelper();
  List<Article> categoryNews = [];

  Future<bool> getNews(String category) async {
    categoryNews.clear();

    if (!keyHelper.hasApiKey) {
      log('NEWS_API_KEY was not provided. Pass --dart-define=NEWS_API_KEY=your_key when running the app.');
      return false;
    }

    final url = Uri.https('newsapi.org', '/v2/top-headlines', {
      'country': 'in',
      'category': category.toLowerCase(),
      'apiKey': keyHelper.apiId,
    });

    try {
      final response = await http.get(url);
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
          categoryNews.add(article);
        }
      }
      return true;
    } catch (error, stackTrace) {
      log('Failed to load category news.', error: error, stackTrace: stackTrace);
      return false;
    }
  }
}
