class KeyHelper {
  static const String _apiKey = String.fromEnvironment('NEWS_API_KEY');

  String get apiId => _apiKey;

  bool get hasApiKey => _apiKey.isNotEmpty;
}
