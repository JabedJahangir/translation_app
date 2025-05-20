import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translated_api_app/data/model/post_model.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;

  PostDetailScreen({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(post.body),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: post.tags
                  .map((tag) => Chip(
                        label: Text(tag),
                      ))
                  .toList(),
            ),
            SizedBox(height: 16),
            Text(
              '${'reactions'.tr} - 👍 ${post.reactions['likes'] ?? 0}, 👎 ${post.reactions['dislikes'] ?? 0}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
