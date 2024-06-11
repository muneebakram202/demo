import 'package:stacked/stacked.dart';

import '../../data/model/post_model.dart';
import '../../data/pre_run_data.dart';
import '../../manager/service_locator.dart';

class PostViewModel extends BaseViewModel{
  List<Post> post= getIt<PreRunData>().post;

}