part of 'post_bloc.dart';

enum PostStatus {
  initial,
  success,
  failure,
  loading,
}

class PostState {
  final List<Post> posts;
  final PostStatus status;
  final String errorMessage;

  const PostState({
    this.posts = const <Post>[],
    this.status = PostStatus.initial,
    this.errorMessage = '',
  });

  PostState copyWith({
    List<Post>? posts,
    PostStatus? status,
    String? errorMessage,
  }) {
    return PostState(
      posts: posts ?? this.posts,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
