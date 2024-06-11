import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'splash_viewmodel.dart';

class SplashScreen extends StackedView<SplashScreenViewModel> {
  const SplashScreen({super.key});

  @override
  Widget builder(
      BuildContext context, SplashScreenViewModel viewModel, Widget? child) {
    return const Scaffold(
      backgroundColor:Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Icon(Icons.flutter_dash_outlined,size: 50,)),
        ],
      ),
    );
  }

  @override
  SplashScreenViewModel viewModelBuilder(BuildContext context) {
    SplashScreenViewModel model = SplashScreenViewModel();
    model.initialize(context);
    return model;
  }
}
