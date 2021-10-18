import 'dart:convert';

import 'package:equatable/equatable.dart';

/// A base class Article 
class Article extends Equatable {
  /// Constructor with optional params with nullable value
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

  /// Mapping JSON 
  /// return [Article]
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
  /// Convenience way to convert JSON object to this class
  /// Converting json to this class within fromMap function
  /// return [Article] 
  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source) as Map<String, dynamic>);

  /// Source of News is provided
  final Source? source;

  /// Author of this article
  final String? author;

  /// Title of article
  final String? title;

  /// Description of article
  final String? description;

  /// Link url of article
  final String? url;

  /// Image url of article
  final String? urlImage;

  /// Date of this article published with ISO8601 format
  final String? publishedAt;

  /// Content of this article truncated 200 characters length
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

  /// Convenience way to send data with JSON object
  /// Encoded JSON map from [toMap()] function
  /// return [String] 
  String toJson() => json.encode(toMap());

  /// Mapping this class property to map and will be encoded
  /// return [Map<String, Object?>] 
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

/// Base class Source 
class Source extends Equatable {
  /// Constructor with optional params with nullable value
  const Source({
    this.id,
    this.name,
  });

  /// Convenience way to convert JSON object to this class
  /// Converting json to this class within fromMap function 
  /// return [Source]
  factory Source.fromJson(String source) =>
      Source.fromMap(json.decode(source) as Map<String, Object?>);

  /// Mapping [fromMap()] function
  /// return [Source] 
  factory Source.fromMap(Map<String, Object?> map) {
    return Source(
      id: map['id'] as String?,
      name: map['name'] as String?,
    );
  }

  /// Name of source
  final String? name;

  /// Id of source
  final String? id
  
  @override
  List<Object?> get props => [name, id];

  /// Convenience way to send data with JSON object
  /// Encode json from [toMap()] 
  /// return [String]
  String toJson() => json.encode(toMap());

  /// Mapping this class property to map and will be encoded
  /// return [Map<String, Object?>]
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
