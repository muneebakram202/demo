import 'package:demo/data/pre_run_data.dart';
import 'package:demo/presentation/post_screen/post_comment_viewmodel.dart';
import 'package:demo/presentation/post_screen/post_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../data/model/post_model.dart';
import '../../utils/route/routes.dart';

class PostCommentView extends StackedView<PostCommentViewModel> {
  const PostCommentView({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget builder(
      BuildContext context, PostCommentViewModel viewModel, Widget? child) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Text("Comment Section",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              SizedBox(height: 10,),
              Text("Post Id: ${post.id}"),
              SizedBox(height: 6,),
              Text("Post title: ${post.title}"),
              SizedBox(height: 6,),
              Text("Post body: ${post.body}"),
              SizedBox(height: 6,),
              if(post.id>4)...{
        Text("No Comment Available for this Post"),
        }else
              ...{
                Text("person name: ${viewModel.comment[post.id].name}"),
                SizedBox(
                  height: 6,
                ),
                Text("person email: ${viewModel.comment[post.id].email}"),
                SizedBox(
                  height: 6,
                ),
                Text("comment: ${viewModel.comment[post.id].body}"),
              }
            ],
          ),
        ),
      ),
    );
  }

  @override
  PostCommentViewModel viewModelBuilder(BuildContext context) =>
      PostCommentViewModel();
}
