import 'package:flutter/material.dart';
import '../models/post.dart';

class PostItem extends StatelessWidget {
  final Post post;
  final VoidCallback? onTap;

  const PostItem({
    Key? key,
    required this.post,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(11.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 33, 36, 39),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              "publié le ${post.formattedPublishDate} à ${post.formattedPublishTime}",
              style: const TextStyle(
                fontSize: 11.0,
                color: Color.fromARGB(255, 164, 164, 164),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              post.description,
              style: const TextStyle(
                fontSize: 13.0,
                color: Color.fromARGB(255, 190, 190, 190),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
