import 'package:hive/hive.dart';
import '../models/post_model.dart';

class LocalStorage {
  final Box<PostModel> _postBox = Hive.box('posts');

  Future<void> cachePosts(List<PostModel> posts) async {
    await _postBox.clear();
    for (var post in posts) {
      _postBox.put(post.id, post);
    }
  }

  List<PostModel> getCachedPosts() {
    return _postBox.values.toList();
  }
}
