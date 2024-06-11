import 'package:demo/presentation/album_screen/detail_album_view.dart';
import 'package:demo/presentation/not_found_screen/not_found_view.dart';
import 'package:demo/presentation/post_screen/post_comment_view.dart';
import 'package:demo/utils/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked_annotations.dart';
import '../../presentation/bottom_nav_bar.dart';
import '../../presentation/home_screen/home_view.dart';
import '../../presentation/splash_screen/splash_view.dart';

@LazySingleton()
class RouteManager {
  String initialRoute = Routes.root;

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return buildMaterialPageRoute(
            route: const SplashScreen(), settings: settings);
      case Routes.bottomNavBar:
        return buildMaterialPageRoute(
            route: BottomNavBar(), settings: settings);
      case Routes.detailAlbum:
        return buildMaterialPageRoute(
            route: DetailAlbumView(
                albumUrl: (settings.arguments as List)[0],
                title: (settings.arguments as List)[1],
            tag: (settings.arguments as List)[1]),
            settings: settings);
      case Routes.postComment:
        return buildMaterialPageRoute(
            route: PostCommentView(
                post: (settings.arguments as List)[0]),
            settings: settings);
      default:
        return buildMaterialPageRoute(
            route: const NotFoundScreen(), settings: settings);
    }
  }

  MaterialPageRoute buildMaterialPageRoute(
      {required Widget route,
      required RouteSettings settings,
      bool? maintainState}) {
    return MaterialPageRoute(
      maintainState: maintainState ?? true,
      builder: (_) => route,
      settings: settings,
    );
  }
}
