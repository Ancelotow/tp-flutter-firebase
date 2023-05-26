import 'package:tp_flutter_firebase/posts_screen/data_source/post_data_source.dart';
import 'package:tp_flutter_firebase/posts_screen/repository/post_repository.dart';

import '../models/post.dart';

class FirestorePostRepository implements PostRepository {
  final PostDataSource _postDataSource;

  FirestorePostRepository(this._postDataSource);

  @override
  Future<List<Post>> getPosts() async {
    final postsDto = await _postDataSource.getPosts();
    return postsDto.map(Post.fromPostDto).toList();
  }
}