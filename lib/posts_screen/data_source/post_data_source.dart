import '../dto/post_dto.dart';

abstract class PostDataSource {
  Future<List<PostDto>> getPosts();
}