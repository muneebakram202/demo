import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';


class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    Future<void> refresh() async {
      viewModel.rebuildUi;
    }
    return  RefreshIndicator(
        onRefresh: refresh,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: (){
                    viewModel.pickImage();
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey[400],
                    ),
                    child: Center(
                      child: viewModel.pickedFile == null
                          ?const Icon(Icons.camera_alt,size: 50,)
                          : ClipRRect(
                        borderRadius:
                        BorderRadius.circular(100),
                        child: Image.file(
                          File(viewModel
                              .pickedFile!.path),
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),

                ),
              ),
              SizedBox(height: 40,),
              Text('Name: ${viewModel.user.name}'),
              SizedBox(height: 6,),
              Text('Username: ${viewModel.user.username}'),
              SizedBox(height: 6,),
              Text('Address: ${viewModel.user.address.city} ${viewModel.user.address.street} ${viewModel.user.address.suite} ${viewModel.user.address.zipcode}'),
              SizedBox(height: 6,),
              Text('Phone: ${viewModel.user.phone}'),
              SizedBox(height: 6,),
              Text('Website: ${viewModel.user.website}'),
              SizedBox(height: 6,),
              Text('Company: ${viewModel.user.company.name} ${viewModel.user.company.bs} ${viewModel.user.company.catchPhrase}'),
              SizedBox(height: 6,),
              Text('Current Location: ${viewModel.location} '),
            ],
          ),
        ),
      );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) {
    HomeViewModel obj = HomeViewModel();
    obj.getLocation();
    return obj;
  }
}
