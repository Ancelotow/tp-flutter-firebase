import 'package:cloud_firestore/cloud_firestore.dart';

class PostDto {
  final String id;
  final String title;
  final String description;
  final DateTime publishDate;

  PostDto({
    required this.id,
    required this.title,
    required this.description,
    required this.publishDate,
  });

  factory PostDto.fromJson(Map<String, dynamic> json, String id) {
    return PostDto(
      id: id,
      title: json['title'],
      description: json['description'] ,
      publishDate: (json['publish_date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'publish_date': Timestamp.fromDate(publishDate),
    };
  }
}
