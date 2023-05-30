import 'dart:async';

import 'package:tp_flutter_firebase/posts_screen/data_source/post_data_source.dart';
import 'package:tp_flutter_firebase/posts_screen/repository/post_repository.dart';

import '../models/post.dart';

class FirestorePostRepository implements PostRepository {
  final PostDataSource _postDataSource;
  final StreamController<List<Post>> _postStreamController =
      StreamController<List<Post>>.broadcast();

  FirestorePostRepository(this._postDataSource);

  @override
  Future<List<Post>> getPosts() async {
    final postsDto = await _postDataSource.getPosts();
    return postsDto.map(Post.fromPostDto).toList();
  }

  @override
  Stream<List<Post>> getPostsStream() {
    final stream = _postDataSource.getPostsStream().map((postDtoList) {
      return postDtoList.map(Post.fromPostDto).toList();
    });

    stream.listen(
      (data) {
        if (!_postStreamController.isClosed) {
          _postStreamController.add(data);
        }
      },
      onError: (error) {
        if (!_postStreamController.isClosed) {
          _postStreamController.addError(error);
        }
      },
    );

    return _postStreamController.stream;
  }
}
