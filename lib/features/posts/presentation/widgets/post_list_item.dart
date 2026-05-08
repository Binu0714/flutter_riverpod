import 'package:flutter/material.dart';
import '../../domain/entities/post.dart';

class PostListItem extends StatelessWidget {
  final Post post;
  const PostListItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(post.body, maxLines: 2),
      leading: CircleAvatar(child: Text(post.id.toString())),
    );
  }
}