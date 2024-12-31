import 'dart:convert';
import 'package:http/http.dart' as http;

class Post {
  final int id;
  final String title;
  final String content;
  final String imageUrl;

  Post(
      {required this.id,
      required this.title,
      required this.content,
      required this.imageUrl});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title']['rendered'],
      content: json['content']['rendered'],
      imageUrl: json['_embedded']['wp:featuredmedia']?[0]['source_url'] ??
          '', // Verifica si hay imagen
    );
  }
}

class ApiResponse {
  static const String baseUrl =
      'https://maxiradiofm.com/wp-json/wp/v2/posts?_embed';

  static Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al cargar las publicaciones');
    }
  }
}
