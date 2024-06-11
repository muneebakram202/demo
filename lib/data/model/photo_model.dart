class Photo {
  int id;
  String title;
  String url;
  String thumbnail;

  Photo({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.url,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnail,
    };
  }

  factory Photo.fromJson(Map<dynamic, dynamic> json) {
    return Photo(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnail: json['thumbnailUrl'],
    );
  }
}
