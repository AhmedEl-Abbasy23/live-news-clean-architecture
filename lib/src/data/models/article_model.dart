import 'package:live_news/src/data/models/source_model.dart';
import 'package:live_news/src/domain/entities/article.dart';

class ArticleModel extends Article {
  const ArticleModel({
    int? id,
    SourceModel? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) : super(
          id: id,
          source: source,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  factory ArticleModel.fromJson(Map<String, dynamic>? map) {
    // if (map == null) return null;
    return ArticleModel(
      source: SourceModel.fromJson(map!['source']),
      author: map['author'],
      title: map['title'],
      description: map['description'],
      url: map['url'],
      urlToImage: map['urlToImage'],
      publishedAt: map['publishedAt'],
      content: map['content'],
    );
  }
}
