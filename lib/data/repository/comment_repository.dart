import '../api/api.dart';
import '../api/api_const.dart';

abstract class ICommentRepository{
  void getComment({required void Function(List<dynamic>, bool) completion});
}
class CommentRepository extends ICommentRepository{
  final Api api;
  CommentRepository({required this.api});
  @override
  void getComment({required void Function(List<dynamic>, bool) completion}) {
    api.callGetApi(
      url: ApiConst.getComments,
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