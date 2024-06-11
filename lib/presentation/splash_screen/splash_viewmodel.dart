import 'package:demo/data/repository/profile_repository.dart';
import 'package:demo/manager/data_extractor.dart';
import 'package:hive/hive.dart';

import '../../manager/service_locator.dart';
import 'package:demo/data/repository/comment_repository.dart';
import 'package:demo/data/repository/photo_repository.dart';
import 'package:demo/data/repository/post_repository.dart';
import 'package:demo/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:stacked/stacked.dart';
import '../../data/pre_run_data.dart';
import '../../data/repository/album_repository.dart';
import '../../manager/session_data.dart';
import '../../manager/session_manager.dart';
import '../../utils/route/routes.dart';

class SplashScreenViewModel extends BaseViewModel with WidgetsBindingObserver {

  void initialize(BuildContext context) {
    WidgetsBinding.instance.addObserver(this);
    storeDeviceIdAndCallAPI(context);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        storeDeviceIdAndCallAPI(AppUtils.navKey.currentContext!);
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }

  void storeDeviceIdAndCallAPI(BuildContext context) async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    if (!isConnected) {
      AppUtils.scaffoldKey.currentState?.showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          margin: EdgeInsets.only(bottom: 40, left: 10, right: 10),
          behavior: SnackBarBehavior.floating,
          content: Text(
            "No Internet",
            style: TextStyle(color: Colors.white),
          )));
      if(await SessionManager.isAccessTokenAvailable()) {
        SessionData? storedSessionData = await SessionManager.getSessionData();
        if (storedSessionData != null) {
          Navigator.pushReplacementNamed(context, Routes.bottomNavBar);
        }
      }
    } else {
      getAlbums(context);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> getAlbums(BuildContext context) async{
    getIt<IAlbumRepository>().getAlbums(completion: (response, success) {
      if (success) {
        getIt<PreRunData>().albumResponse=response;
        getIt<PreRunData>().album = ExtractData().extractAlbums(response);
        getComment(context);
    }
    });
  }

  Future<void> getProfile(BuildContext context) async{
    getIt<IProfileRepository>().getProfile(completion: (response, success) {
      if (success) {
        getIt<PreRunData>().userResponse=response;
        getIt<PreRunData>().user = ExtractData().extractUser(response);
        removeAndSaveData();
        Navigator.pushReplacementNamed(context, Routes.bottomNavBar);
      }
    });
  }

  Future<void> getPhoto(BuildContext context) async {
    getIt<IPhotosRepository>().getPhotos(completion: (response, success) async {
      if (success) {
        getIt<PreRunData>().photoResponse=response;
        getIt<PreRunData>().photo = ExtractData().extractPhotos(response);
        getProfile(context);
      }
    });
  }

  Future<void> getPost(BuildContext context) async{
    getIt<IPostRepository>().getPost(completion: (response, success) {
      if (success) {
        getIt<PreRunData>().postResponse=response;
        getIt<PreRunData>().post = ExtractData().extractPost(response);
        getPhoto(context);
    }
    });
  }

  Future<void> getComment(BuildContext context) async{
    getIt<ICommentRepository>().getComment(completion: (response, success) {
      if (success) {
        getIt<PreRunData>().commentResponse=response;
        getIt<PreRunData>().comment = ExtractData().extractComment(response);
        getPost(context);
    }
    });
  }
  void removeAndSaveData()async{
    await SessionManager.saveSessionData();
  }
}
