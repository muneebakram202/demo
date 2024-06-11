
import 'package:demo/manager/service_locator.dart';
import 'package:demo/manager/session_data.dart';
import 'package:hive/hive.dart';

import '../data/pre_run_data.dart';

class SessionManager {
  static const String _boxName = 'sessionBox';
  static const String _sessionDataKey = 'sessionDataKey';

  static Future<void> saveSessionData() async {
    final sessionBox = await Hive.openBox<SessionData>(_boxName);
    final SessionData sessionData = SessionData(
      album: getIt<PreRunData>().album,
      comment: getIt<PreRunData>().comment,
      photo: getIt<PreRunData>().photo,
      post: getIt<PreRunData>().post,
      user: getIt<PreRunData>().user,
    );
    await sessionBox.put(_sessionDataKey, sessionData);
  }

  static Future<SessionData?> getSessionData() async {
    final sessionBox = await Hive.openBox<SessionData>(_boxName);
    SessionData? storedSessionData = sessionBox.get('sessionDataKey');
    if(storedSessionData!=null){
      getIt<PreRunData>().photo = storedSessionData.photo;
      getIt<PreRunData>().album = storedSessionData.album;
      getIt<PreRunData>().comment = storedSessionData.comment;
      getIt<PreRunData>().post = storedSessionData.post;
      getIt<PreRunData>().user = storedSessionData.user;
    }
    return storedSessionData;
  }

  static Future<void> removeAccessToken() async {
    final sessionBox = await Hive.openBox<SessionData>(_boxName);
    await sessionBox.delete(_sessionDataKey);
  }

  static Future<bool> isAccessTokenAvailable() async {
    try {
      final sessionBox = await Hive.openBox<SessionData>(_boxName);
      bool flag = sessionBox.containsKey(_sessionDataKey);
      return flag;
    } catch (e) {
      return false;
    }
  }
}
