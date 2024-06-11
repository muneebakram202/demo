import '../api/api.dart';
import '../api/api_const.dart';

abstract class IPhotosRepository{
  void getPhotos({required void Function(List<dynamic>, bool) completion});
}
class PhotosRepository extends IPhotosRepository{
  final Api api;
  PhotosRepository({required this.api});
  @override
  void getPhotos({required void Function(List<dynamic>, bool) completion}) {
    api.callGetApi(
      url: ApiConst.getPhotos,
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