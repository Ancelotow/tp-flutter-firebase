part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class GetAllPosts extends PostEvent {

  GetAllPosts();
}

class AddPost extends PostEvent {
  final Post post;

  AddPost({
    required this.post,
  });
}
