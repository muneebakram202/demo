class Post {
  int id;
  String title;
  String body;

  Post({
    required this.id,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory Post.fromJson(Map<dynamic, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
