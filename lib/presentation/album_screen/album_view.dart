import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/presentation/album_screen/album_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../utils/route/routes.dart';

class AlbumView extends StackedView<AlbumViewModel> {
  const AlbumView({super.key});

  @override
  Widget builder(
      BuildContext context, AlbumViewModel viewModel, Widget? child) {
    Future<void> refresh() async {
      viewModel.getAlbums(context);
    }

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: refresh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 20),
                child: Text(
                  'Album',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                padding: const EdgeInsets.symmetric(vertical: 20),
                itemCount: viewModel.albums.length,
                itemBuilder: (BuildContext context, int index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed(Routes.detailAlbum, arguments: [
                      viewModel.photos[index].url,
                      viewModel.albums[index],
                      '${viewModel.photos[index].id}',
                    ]);
                  },
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Hero(
                          tag: '${viewModel.photos[index].id}',
                          child: CachedNetworkImage(
                            imageUrl: viewModel.photos[index].thumbnail,
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => Center(
                              child: Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            viewModel.albums[index],
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            textAlign: TextAlign.center, // Optional, adjust as needed
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  AlbumViewModel viewModelBuilder(BuildContext context) => AlbumViewModel();
}
