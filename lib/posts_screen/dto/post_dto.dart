import 'package:cloud_firestore/cloud_firestore.dart';

class PostDto {
  final String id;
  final String title;
  final String description;
  final DateTime publishDate;
  final bool isUpdated;

  PostDto({
    required this.id,
    required this.title,
    required this.description,
    required this.publishDate,
    this.isUpdated = false,
  });

  factory PostDto.fromJson(Map<String, dynamic> json, String id) {
    return PostDto(
      id: id,
      title: json['title'],
      description: json['description'] ,
      isUpdated: json['is_updated'] as bool,
      publishDate: (json['publish_date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'publish_date': Timestamp.fromDate(publishDate),
      'is_updated': isUpdated,
    };
  }
}
