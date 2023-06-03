import 'dart:async';
import 'package:tp_flutter_firebase/posts_screen/models/post.dart';
import 'package:tp_flutter_firebase/posts_screen/repository/post_repository.dart';

class EmptyPostRepository extends PostRepository {
  final StreamController<List<Post>> _controller =
  StreamController<List<Post>>();

  @override
  Future<String> addPost(Post post) {
    throw UnimplementedError();
  }

  @override
  Stream<List<Post>> getPostsStream() {
    _controller.add(<Post>[]);
    return _controller.stream;
  }

  @override
  Future<void> updatePost(Post post) {
    throw UnimplementedError();
  }
}