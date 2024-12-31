import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final baseUrl = "https://maxiradiofm.com/wp-json/wp/v2/posts";

  Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Error al cargar datos");
    }
  }
}
