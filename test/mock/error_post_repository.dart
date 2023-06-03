import 'package:tp_flutter_firebase/posts_screen/models/post.dart';
import 'package:tp_flutter_firebase/posts_screen/repository/post_repository.dart';

class ErrorPostRepository extends PostRepository {

  @override
  Future<String> addPost(Post post) {
    throw UnimplementedError();
  }

  @override
  Stream<List<Post>> getPostsStream() {
    throw Exception("Test error");
  }

  @override
  Future<void> updatePost(Post post) {
    throw UnimplementedError();
  }
}