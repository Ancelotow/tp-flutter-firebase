import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tp_flutter_firebase/posts_screen/data_source/post_data_source.dart';
import '../models/dto/post_dto.dart';

class FirestorePostDataSource implements PostDataSource {
  final StreamController<List<PostDto>> _postStreamController =
      StreamController<List<PostDto>>.broadcast();

  @override
  Stream<List<PostDto>> getPostsStream() {
    FirebaseFirestore.instance
        .collection('posts')
        .orderBy("publish_date", descending: true)
        .snapshots()
        .listen((snapshot) {
      final postDtoList =
          snapshot.docs.map((e) => PostDto.fromJson(e.data(), e.id)).toList();
      _postStreamController.add(postDtoList);
    });

    return _postStreamController.stream;
  }

  @override
  Future<String> addPost(PostDto post) async {
    final ref = await FirebaseFirestore.instance
        .collection('posts')
        .add(post.toJson());
    return ref.id;
  }

  @override
  Future<void> updatePost(PostDto post) async {
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(post.id)
        .update(post.toJson());
  }
}
