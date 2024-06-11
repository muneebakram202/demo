import 'package:demo/data/model/comment_model.dart';

import '../data/model/photo_model.dart';
import '../data/model/post_model.dart';
import '../data/model/user_model.dart';

class ExtractData{

  List<String> extractAlbums(jsonResponse) {
    List<dynamic> data = jsonResponse;
    List<String> titles = [];

    for (var item in data) {
      titles.add(item['title']);
    }
    return titles;
  }

  List<Photo> extractPhotos(response) {
    List<dynamic> data = response;
    List<Photo> list = [];
    for (var item in data) {
      list.add(Photo(
          id: item['id'],
          title: item['title'],
          thumbnail: item['thumbnailUrl'],
          url: item['url']));
    }
    return list;
  }

  List<Post> extractPost(response) {
    List<dynamic> data = response;
    List<Post> list = [];
    for (var item in data) {
      list.add(Post(
          id: item['id'],
          title: item['title'],
          body: item['body']));
    }
    return list;
  }

  List<Comment> extractComment(response) {
    List<dynamic> data = response;
    List<Comment> list = [];
    for (var item in data) {
      list.add(Comment(
          id: item['id'],
          name: item['name'],
          email: item['email'],
          body: item['body']));
    }
    return list;
  }

  User extractUser(response) {
    return User(
        id: response[0]['id'].toString(),
        name: response[0]['name'],
        username: response[0]['username'],
        email: response[0]['email'],
        address: Address(
            street: response[0]['address']['street'],
            suite: response[0]['address']['suite'],
            city: response[0]['address']['city'],
            zipcode: response[0]['address']['zipcode']),
        phone: response[0]['phone'],
        website: response[0]['website'],
        company: Company(
            name: response[0]['company']['name'],
            catchPhrase: response[0]['company']['catchPhrase'],
            bs: response[0]['company']['bs']));
  }
}