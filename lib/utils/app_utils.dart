import 'package:flutter/material.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

@LazySingleton()
class AppUtils{

  static final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  static final GlobalKey<ScaffoldMessengerState> scaffoldKey =
  GlobalKey<ScaffoldMessengerState>();
  void dismissLoader() {
    navKey.currentState?.pop();
  }

  void showProgressLoader(
      BuildContext context, {
        Color? barrierColor,
        bool barrierDismissible = false,
      }) {
    showDialog(
      context: context,
      barrierColor: barrierColor ?? Colors.black.withOpacity(0.8),
      barrierDismissible: barrierDismissible,
      builder: (_) {
        return const PopScope(
          canPop: false,
          child: Center(
            child: SpinKitFadingCircle(
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}