import 'package:tp_flutter_firebase/posts_screen/dto/post_dto.dart';

class Post {
  final String id;
  final String title;
  final String description;
  final DateTime publishDate;

  Post({
    required this.id,
    required this.title,
    required this.description,
    required this.publishDate,
  });

  factory Post.fromPostDto(PostDto dto) {
    return Post(
      id: dto.id,
      title: dto.title,
      description: dto.description,
      publishDate: dto.publishDate,
    );
  }
}