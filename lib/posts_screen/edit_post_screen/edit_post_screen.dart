import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/post_bloc.dart';
import '../models/post.dart';
import '../providers/analytics_provider.dart';
import '../widgets/input_text.dart';
import '../widgets/my_icon_button.dart';

class EditPostScreen extends StatelessWidget {
  static const routeName = '/edit-post-screen';

  final Post post;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  EditPostScreen({
    super.key,
    required this.post,
  }) {
    _titleController.text = post.title;
    _descriptionController.text = post.description;
  }

  static void navigateTo(BuildContext context, Post post) {
    Navigator.of(context).pushNamed(routeName, arguments: post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 17, 18),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MyIconButton(
                  label: "Update post",
                  icon: Icons.arrow_back_ios_rounded,
                  textColor: Colors.white,
                  size: 18,
                  onPressed: () => _back(context),
                ),
              ),
              InputText(
                placeholder: "Title of your post...",
                textColor: Colors.white,
                fontSize: 20,
                controller: _titleController,
              ),
              const SizedBox(
                height: 10.0,
              ),
              InputText(
                placeholder: "My minds...",
                maxLines: 10,
                textColor: const Color.fromARGB(255, 164, 164, 164),
                fontSize: 18,
                controller: _descriptionController,
              ),
              const Spacer(),
              BlocConsumer<PostBloc, PostState>(
                listener: (context, state) {
                  switch (state.status) {
                    case PostStatus.editSuccess:
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Post updated successfully"),
                          backgroundColor: Colors.green,
                        ),
                      );
                      _back(context);
                      break;

                    case PostStatus.failure:
                      AnalyticsProvider.of(context).errorAnalytics.logError(
                            message: state.errorMessage,
                            stackTrace: StackTrace.current,
                            fatal: true,
                          );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errorMessage),
                          backgroundColor: Colors.red,
                        ),
                      );
                      break;

                    default:
                      break;
                  }
                },
                builder: (context, state) {
                  switch (state.status) {
                    case PostStatus.loading:
                      return const CircularProgressIndicator(
                        color: Colors.purple,
                      );

                    default:
                      return Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple),
                          onPressed: () => _save(context),
                          child: const Text("Edit post"),
                        ),
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _back(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _save(BuildContext context) {
    var bloc = BlocProvider.of<PostBloc>(context);
    final postUpdate = Post(
      title: _titleController.text,
      description: _descriptionController.text,
      id: post.id,
      publishDate: DateTime.now(),
    );
    bloc.add(UpdatePost(post: postUpdate));
  }
}
