import 'dart:convert';

import 'package:demo/data/pre_run_data.dart';
import 'package:demo/data/repository/album_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../data/api/api.dart';
import '../../data/data_module.dart';
import '../../data/model/photo_model.dart';
import '../../manager/service_locator.dart';
import '../../utils/app_utils.dart';

class AlbumViewModel extends BaseViewModel {
  List<String> albums = getIt<PreRunData>().album;
  List<Photo> photos = getIt<PreRunData>().photo;


  Future<void> getAlbums(BuildContext context)async {
    rebuildUi();
  }

}
