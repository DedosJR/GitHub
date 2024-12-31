import 'dart:convert';
import 'package:http/http.dart' as http;

class NowPlayingService {
  static const String url =
      "https://server1.maxiradiofm.com/api/station/1/nowplaying";

  static Future<Map<String, dynamic>> fetchNowPlaying() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // Decodificar correctamente la respuesta
        final decodedResponse = utf8.decode(response.bodyBytes);
        return jsonDecode(decodedResponse);
      } else {
        throw Exception("Error al obtener los datos de Now Playing");
      }
    } catch (e) {
      throw Exception("Error: ${e.toString()}");
    }
  }
}
