
import 'package:demo/data/model/comment_model.dart';
import 'package:stacked/stacked_annotations.dart';

import 'model/photo_model.dart';
import 'model/post_model.dart';
import 'model/user_model.dart';

@LazySingleton()
class PreRunData {
  List<Photo> photo = [];
  List<String> album = [];
  List<Comment> comment = [];
  List<Post> post = [];
  late User user ;

  dynamic photoResponse ;
  dynamic albumResponse;
  dynamic commentResponse;
  dynamic postResponse;
  dynamic userResponse;
}
