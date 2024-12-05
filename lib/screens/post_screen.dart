import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';
import '../widgets/post_item.dart';

class PostScreen extends StatelessWidget {
  final PostController _controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offline Viewer'),
      ),
      body: Obx(() {
        if (_controller.posts.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: _controller.posts.length,
          itemBuilder: (context, index) {
            return PostItem(post: _controller.posts[index]);
          },
        );
      }),
    );
  }
}
