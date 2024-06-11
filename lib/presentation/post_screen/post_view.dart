import 'package:demo/presentation/post_screen/post_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

import '../../utils/route/routes.dart';

class PostView extends StackedView<PostViewModel> {
  const PostView({super.key});

  @override
  Widget builder(BuildContext context, PostViewModel viewModel, Widget? child) {
    return SafeArea(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 20),
          itemCount:viewModel.post.length,
          itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed(Routes.postComment, arguments: [
                  viewModel.post[index],
                ]);
              },
              title: Text('Title: ${viewModel.post[index].title}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              subtitle: Text('Body: ${viewModel.post[index].body}'),
            ),
            if(!(viewModel.post.last==viewModel.post[index]))
            Container(
              height: 2,
              width: MediaQuery.sizeOf(context).width,
              color:Colors.grey,
            )
          ],
        );
      }),
    );
  }

  @override
  PostViewModel viewModelBuilder(BuildContext context) => PostViewModel();
}
