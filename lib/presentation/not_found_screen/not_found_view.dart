import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'not_found_viewmodel.dart';


class NotFoundScreen extends StackedView<NotFoundViewModel> {
  const NotFoundScreen({super.key});

  @override
  Widget builder(
      BuildContext context, NotFoundViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("404"),
              ElevatedButton(
                child:Text( "Ok"),
                onPressed: () {  },),
            ],
          ),
        ],
      ),
    );
  }



  @override
  NotFoundViewModel viewModelBuilder(BuildContext context) =>
      NotFoundViewModel();
}
