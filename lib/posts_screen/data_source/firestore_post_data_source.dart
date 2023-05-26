import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tp_flutter_firebase/posts_screen/data_source/post_data_source.dart';
import 'package:tp_flutter_firebase/posts_screen/dto/post_dto.dart';

class FirestorePostDataSource implements PostDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<PostDto>> getPosts() async {
    final query = await _firestore
        .collection('posts')
        .orderBy('publish_date', descending: true)
        .get();
    return query.docs.map((e) => PostDto.fromJson(e.data(), e.id)).toList();
  }
}