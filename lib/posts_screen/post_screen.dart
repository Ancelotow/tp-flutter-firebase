import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_flutter_firebase/posts_screen/widgets/post_item.dart';
import 'blocs/post_bloc.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PostBloc>(context).add(GetAllPosts());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 17, 18),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.status) {
            case PostStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case PostStatus.failure:
              FirebaseCrashlytics.instance.recordError(state.errorMessage, StackTrace.current, fatal: true);
              return const Center(
                child: Text(
                  "Oops.. Something went wrong!",
                ),
              );

            case PostStatus.success:
            default:
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: PostItem(
                      post: post,
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
    // TODO
  }
}
