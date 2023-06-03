import 'dart:async';
import 'package:tp_flutter_firebase/posts_screen/models/post.dart';
import 'package:tp_flutter_firebase/posts_screen/repository/post_repository.dart';

class SuccessPostRepository extends PostRepository {
  final StreamController<List<Post>> _controller =
      StreamController<List<Post>>();

  @override
  Future<String> addPost(Post post) {
    throw UnimplementedError();
  }

  @override
  Stream<List<Post>> getPostsStream() {
    _controller.add(<Post>[
      Post(
          id: "20",
          title: "test post",
          description: "description",
          publishDate: DateTime.now())
    ]);
    return _controller.stream;
  }

  @override
  Future<void> updatePost(Post post) {
    throw UnimplementedError();
  }
}
