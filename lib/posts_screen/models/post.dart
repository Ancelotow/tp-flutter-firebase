import 'package:intl/intl.dart';
import 'dto/post_dto.dart';

class Post {
  final String id;
  final String title;
  final String description;
  final DateTime publishDate;
  final bool isUpdated;

  Post({
    required this.id,
    required this.title,
    required this.description,
    required this.publishDate,
    this.isUpdated = false,
  });

  factory Post.fromPostDto(PostDto dto) {
    return Post(
      id: dto.id,
      title: dto.title,
      description: dto.description,
      publishDate: dto.publishDate,
      isUpdated: dto.isUpdated,
    );
  }

  PostDto toPostDto() {
    return PostDto(
      id: id,
      title: title,
      description: description,
      publishDate: publishDate,
      isUpdated: isUpdated,
    );
  }

  String get formattedPublishDate {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(publishDate);
  }

  String get formattedPublishTime {
    final formatter = DateFormat('HH:mm');
    return formatter.format(publishDate);
  }

  Post copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? publishDate,
    bool? isUpdated,
  }) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      publishDate: publishDate ?? this.publishDate,
      isUpdated: isUpdated ?? this.isUpdated,
    );
  }
}