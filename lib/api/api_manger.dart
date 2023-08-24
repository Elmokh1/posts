import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:post_task/api/post_model.dart';

Future<List<Post>> ApiManger() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts?_limit=10&_start=0&_lang=en'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((post) => Post.fromJson(post)).toList();
  } else {
    throw Exception('Failed to load English posts');
  }
}

