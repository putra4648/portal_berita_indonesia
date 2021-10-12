import 'dart:convert';

import 'package:equatable/equatable.dart';

/// A class Article will be used as model
/// to decode JSON to this class
class Article extends Equatable {
  /// Constructor
  const Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlImage,
    this.publishedAt,
    this.content,
  });

  /// Function will convert JSON map
  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      source: Source.fromMap(map['source'] as Map<String, Object?>),
      author: map['author'] as String?,
      title: map['title'] as String?,
      description: map['description'] as String?,
      url: map['url'] as String?,
      urlImage: map['urlToImage'] as String?,
      publishedAt: map['publishedAt'] as String?,
      content: map['content'] as String?,
    );
  }

  /// Converting json to this class
  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source) as Map<String, dynamic>);

  /// Source of News is provided
  final Source? source;

  /// Author of this article
  final String? author;

  /// Title of this article
  final String? title;

  /// Description of this article
  final String? description;

  /// Link url of this article
  final String? url;

  /// Image url of this article
  final String? urlImage;

  /// Date of this article published with ISO8601
  final String? publishedAt;

  /// Conten of this article
  /// but still a characters length existed
  final String? content;

  @override
  List<Object?> get props {
    return [
      source,
      author,
      title,
      description,
      url,
      urlImage,
      publishedAt,
      content,
    ];
  }

  /// Override this class to json string
  String toJson() => json.encode(toMap());

  /// Mapping class to saved database
  Map<String, Object?> toMap() {
    return {
      'source': source?.toMap(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlImage': urlImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }
}

/// Sub-class Article for Source
class Source extends Equatable {
  /// Constructor
  const Source({
    this.name,
  });

  /// Converting json from mapping
  factory Source.fromJson(String source) =>
      Source.fromMap(json.decode(source) as Map<String, Object?>);

  /// Converting mapping to this class
  factory Source.fromMap(Map<String, Object?> map) {
    return Source(
      name: map['name'] as String?,
    );
  }

  /// Name of source
  final String? name;

  /// Mapping class to map
  Map<String, Object?> toMap() {
    return {
      'name': name,
    };
  }

  /// Override json to string
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [name];
}
