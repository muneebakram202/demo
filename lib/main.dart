import 'package:demo/manager/service_locator.dart';
import 'package:demo/utils/app_utils.dart';
import 'package:demo/utils/route/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'manager/session_data_adoptor.dart';
import 'manager/session_data.dart';

Future<void> main() async {
  try{
    await Hive.initFlutter();
    WidgetsFlutterBinding.ensureInitialized();
    Hive.registerAdapter(SessionDataAdapter());
  }catch (exp){
    debugPrint('\n\n $exp \n\n');
  }
  setupServiceLocator();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AppUtils.navKey,
      scaffoldMessengerKey: AppUtils.scaffoldKey,
      initialRoute: getIt<RouteManager>().initialRoute,
      onGenerateRoute: getIt<RouteManager>().onGenerateRoute,
    );
  }
}

