import 'package:get/get.dart';
import '../data/api_client.dart';
import '../data/local_storage.dart';
import '../models/post_model.dart';

class PostController extends GetxController {
  final ApiClient _apiClient = ApiClient();
  final LocalStorage _localStorage = LocalStorage();

  var posts = <PostModel>[].obs;
  var isOffline = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      final fetchedData = await _apiClient.fetchPosts();
      final postList =
          fetchedData.map((data) => PostModel.fromJson(data)).toList();
      posts.value = postList;
      await _localStorage.cachePosts(postList);
    } catch (e) {
      isOffline.value = true;
      posts.value = _localStorage.getCachedPosts();
    }
  }
}
