

import 'package:demo/utils/app_utils.dart';
import 'package:demo/utils/route/route_manager.dart';
import 'package:get_it/get_it.dart';

import '../data/data_module.dart';
import '../data/pre_run_data.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator(){
  DataModule().load();
  getIt.registerLazySingleton(() => PreRunData());
  getIt.registerLazySingleton(() => AppUtils());
  getIt.registerLazySingleton(() => RouteManager());


}