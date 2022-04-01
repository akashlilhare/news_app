class Article {
 final String title;
 final String author;
 final String description;
 final String urlToImage;
 final String publshedAt;
 final String content;
 final String articleUrl;
 final String source;

  Article(
      {required this.source,
      required this.title,
      required this.description,
      required this.author,
      required this.content,
      required this.publshedAt,
      required this.urlToImage,
      required this.articleUrl});
}
