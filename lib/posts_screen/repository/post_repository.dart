import '../models/post.dart';

abstract class PostRepository {
  Stream<List<Post>> getPostsStream();

  Future<String> addPost(Post post);
}