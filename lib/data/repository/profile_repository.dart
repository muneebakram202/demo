import '../api/api.dart';
import '../api/api_const.dart';

abstract class IProfileRepository{
  void getProfile({required void Function(dynamic, bool) completion});
}
class ProfileRepository extends IProfileRepository{
  final Api api;
  ProfileRepository({required this.api});
  @override
  void getProfile({required void Function(dynamic, bool) completion}) {
    api.callGetApi(
      url: ApiConst.getProfile,
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