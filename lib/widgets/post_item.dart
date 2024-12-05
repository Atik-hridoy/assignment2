import 'package:flutter/material.dart';
import '../models/post_model.dart';

class PostItem extends StatelessWidget {
  final PostModel post;

  const PostItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(post.title),
        subtitle: Text(post.body),
      ),
    );
  }
}
