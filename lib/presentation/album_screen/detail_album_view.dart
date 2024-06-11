import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class DetailAlbumView extends StatelessWidget {
  final String albumUrl;
  final String title;
  final String tag;
  const DetailAlbumView(
      {super.key, required this.albumUrl, required this.title, required this.tag});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            Hero(
              tag: tag,
              child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: CachedNetworkImage(
                    imageUrl: albumUrl,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Icon(Icons.error),
                    ),
                  ),),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 20,),
                Text('Title:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                SizedBox(width: 6,),
                Text(title),
              ],
            )
          ],
        ),
      ),
    );
  }
}
