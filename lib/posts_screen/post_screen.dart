import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_flutter_firebase/posts_screen/add_post_screen/add_post_screen.dart';
import 'package:tp_flutter_firebase/posts_screen/edit_post_screen/edit_post_screen.dart';
import 'package:tp_flutter_firebase/posts_screen/providers/analytics_provider.dart';
import 'package:tp_flutter_firebase/posts_screen/widgets/post_item.dart';
import 'blocs/post_bloc.dart';
import 'models/post.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PostBloc>(context).add(GetAllPosts());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 17, 18),
      body: BlocConsumer<PostBloc, PostState>(
        listener: (context, state) {
          if (state.status == PostStatus.failure) {
            AnalyticsProvider.of(context).errorAnalytics.logError(
              message: state.errorMessage,
              stackTrace: StackTrace.current,
              fatal: true,
            );
          }
        },
        builder: (context, state) {
          switch (state.status) {
            case PostStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case PostStatus.failure:
              return const Center(
                child: Text(
                  "Oops.. Something went wrong !",
                ),
              );

            case PostStatus.success:
            default:
              if(state.posts.isEmpty){
                return const Center(
                  child: Text(
                    "No posts found\nPlease add some posts",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    )
                  ),
                );
              }
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: PostItem(
                      post: post,
                      onTap: () => _editPost(context, post),
                    ),
                  );
                },
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addPost(context),
        backgroundColor: const Color.fromARGB(255, 43, 46, 49),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  void _addPost(BuildContext context) {
    AddPostScreen.navigateTo(context);
  }

  void _editPost(BuildContext context, Post post) {
    EditPostScreen.navigateTo(context, post);
  }
}
