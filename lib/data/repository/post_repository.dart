import '../api/api.dart';
import '../api/api_const.dart';

abstract class IPostRepository{
  void getPost({required void Function(List<dynamic>, bool) completion});
}
class PostRepository extends IPostRepository{
  final Api api;
  PostRepository({required this.api});
  @override
  void getPost({required void Function(List<dynamic>, bool) completion}) {
    api.callGetApi(
      url: ApiConst.getPosts,
      headers: Api.commonHeaders(),
      responseCompletion: (response, success) {
        if (success) {
          completion(response, true);
        } else {
          completion(response, false);
        }
      },
    );
  }

}