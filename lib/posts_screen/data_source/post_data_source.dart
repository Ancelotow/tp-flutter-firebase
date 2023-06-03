import '../models/dto/post_dto.dart';

abstract class PostDataSource {
  Stream<List<PostDto>> getPostsStream();

  Future<String> addPost(PostDto post);

  Future<void> updatePost(PostDto post);
}