

import 'package:demo/data/api/api.dart';
import 'package:demo/data/repository/album_repository.dart';
import 'package:demo/data/repository/comment_repository.dart';
import 'package:demo/data/repository/photo_repository.dart';
import 'package:demo/data/repository/post_repository.dart';
import 'package:demo/data/repository/profile_repository.dart';
import 'package:demo/manager/service_locator.dart';
import 'package:hive/hive.dart';

import '../manager/session_data.dart';

class DataModule{
  load() async {
    getIt.registerLazySingleton<Api>(()=>Api());
    getIt.registerLazySingleton<IAlbumRepository>(()=>AlbumRepository(api: getIt()));
    getIt.registerLazySingleton<IPhotosRepository>(()=>PhotosRepository(api: getIt()));
    getIt.registerLazySingleton<IPostRepository>(()=>PostRepository(api: getIt()));
    getIt.registerLazySingleton<ICommentRepository>(()=>CommentRepository(api: getIt()));
    getIt.registerLazySingleton<IProfileRepository>(()=>ProfileRepository(api: getIt()));

  }
}