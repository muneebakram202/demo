import 'package:demo/data/model/comment_model.dart';
import 'package:demo/data/pre_run_data.dart';

import '../data/model/photo_model.dart';
import '../data/model/post_model.dart';
import '../data/model/user_model.dart';
import 'data_extractor.dart';

class SessionData {
  final List<Photo> photo;
  final List<String> album;

  final List<Comment> comment;
  final List<Post> post;
  final User user;

  SessionData({
    required this.photo,
    required this.album,
    required this.comment,
    required this.post,
    required this.user,
  });

  factory SessionData.fromJson(Map<dynamic, dynamic> json) {
    List<String> parseAlbum(dynamic json) {
      if (json is List) {
        // Log each item type for debugging
        for (var item in json) {
          print('Album item type: ${item.runtimeType}');
        }
        // Ensure each item is a map and extract the string value
        return json.map((item) {
          print('titile items in album ${ item['title']}');
          if (item is Map && item.containsKey('title') && item['title'] is String) {
            return item['title'] as String;
          } else {
            throw Exception('Invalid item type in album list or missing title key');
          }
        }).toList();
      } else {
        throw Exception('Invalid album type');
      }
    }

    return SessionData(
      comment: (json['comment'] as List).map((i) => Comment.fromJson(i)).toList(),
      photo: (json['photo'] as List).map((i) => Photo.fromJson(i)).toList(),
      post: (json['post'] as List).map((i) => Post.fromJson(i)).toList(),
      album: List<String>.from(json['album']),
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['album'] = this.album;
    data['user'] = this.user.toJson();
    data['comment'] = this.comment.map((item) => item.toJson()).toList();
    data['photo'] = this.photo.map((item) => item.toJson()).toList();
    data['post'] = this.post.map((item) => item.toJson()).toList();
    print('this is the data tojson in session data $data');
    return data;
  }
}
