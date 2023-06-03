import 'package:tp_flutter_firebase/posts_screen/models/post.dart';
import 'package:tp_flutter_firebase/posts_screen/repository/post_repository.dart';

class LoadingPostRepository extends PostRepository {

  @override
  Future<String> addPost(Post post) {
    throw UnimplementedError();
  }

  @override
  Stream<List<Post>> getPostsStream() {
    return const Stream.empty();
  }

  @override
  Future<void> updatePost(Post post) {
    throw UnimplementedError();
  }
}