/// A class Article will be used as model
/// to decode JSON to this class
class Article {
  /// Constructor
  const Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlImage,
    this.publishAt,
    this.content,
  });

  /// Function will convert JSON map and return this class
  factory Article.fromJson(Map<String, dynamic> map) {
    return Article(
      source: Source.fromJson(map['source'] as Map<String, Object?>),
      author: map['author'] as String?,
      title: map['title'] as String?,
      description: map['description'] as String?,
      url: map['url'] as String?,
      urlImage: map['urlImage'] as String?,
      publishAt: map['publishAt'] as String?,
      content: map['content'] as String?,
    );
  }

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

  /// Date of this article published
  final String? publishAt;

  /// Conten of this article
  /// but still a characters length existed
  final String? content;

  /// Function used for saving data to database
  /// if necessarry
  Map<String, Object?> toMap() {
    return {
      'source': source?.toMap(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlImage': urlImage,
      'publishAt': publishAt,
      'content': content,
    };
  }
}

/// Sub-class Article for Source
class Source {
  /// Constructor
  const Source({
    this.id,
    this.name,
  });

  /// Function will convert JSON map and return this class
  factory Source.fromJson(Map<String, dynamic> map) {
    return Source(
      id: map['id'] as int?,
      name: map['name'] as String?,
    );
  }

  /// Id of Source
  final int? id;

  /// Name of source
  final String? name;

  /// Function used for saving data to database
  /// if necessarry
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
