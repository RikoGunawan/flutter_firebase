import 'dart:convert';

import '../models/post.dart';
import 'package:http/http.dart' as http;

class PostService {
  static Future<List<Post>> getPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Post.fromJson(item)).toList();
    }
    throw Exception('Failed to load posts');
  }
}
