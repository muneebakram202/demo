import '../api/api.dart';
import '../api/api_const.dart';

abstract class IAlbumRepository{
  void getAlbums({required void Function(List<dynamic>, bool) completion});
}
class AlbumRepository extends IAlbumRepository{
  final Api api;
  AlbumRepository({required this.api});
  @override
  void getAlbums({required void Function(List<dynamic>, bool) completion}) {
    api.callGetApi(
      url: ApiConst.getAlbums,
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