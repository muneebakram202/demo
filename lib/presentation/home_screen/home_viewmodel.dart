import 'package:demo/data/pre_run_data.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:stacked/stacked.dart';
import 'package:geocoding/geocoding.dart';

import '../../data/model/user_model.dart';
import '../../manager/service_locator.dart';
import '../../utils/app_utils.dart';

class HomeViewModel extends BaseViewModel {
  XFile? pickedFile;
  ImagePicker picker = ImagePicker();
  String location = '';
  User user = getIt<PreRunData>().user;

  Future<void> pickImage() async {
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    rebuildUi();
  }

  Future<void> getLocation() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
    Position position = await _determinePosition();
    List<Placemark> placeMark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    location = '${placeMark[0].subLocality} ${placeMark[0].locality}';}else{
      location='Not found';
    }
    rebuildUi();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        AppUtils.scaffoldKey.currentState?.showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            margin: EdgeInsets.only(bottom: 40, left: 10, right: 10),
            behavior: SnackBarBehavior.floating,
            content: Text(
              'Location permissions are denied',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
        await Geolocator.openLocationSettings();
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      AppUtils.scaffoldKey.currentState?.showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          margin: EdgeInsets.only(bottom: 40, left: 10, right: 10),
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Location permissions are permanently denied, we cannot request permissions.',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      await Geolocator.openLocationSettings();
    }
    return await Geolocator.getCurrentPosition();
  }
}
