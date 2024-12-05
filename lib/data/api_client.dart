import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> fetchPosts() async {
    final response =
        await _dio.get('https://jsonplaceholder.typicode.com/posts');
    return List<Map<String, dynamic>>.from(response.data);
  }
}
