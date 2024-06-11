

import 'package:demo/data/model/comment_model.dart';
import 'package:stacked/stacked.dart';

import '../../data/pre_run_data.dart';
import '../../manager/service_locator.dart';

class PostCommentViewModel extends BaseViewModel{
  List<Comment> comment= getIt<PreRunData>().comment;

}