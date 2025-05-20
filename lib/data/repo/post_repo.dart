import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:translated_api_app/data/model/post_model.dart';


class PostRepository {
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/posts'));
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final posts = data['posts'] as List;
      return posts.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<String> translateToBangla(String text) async {
  final url = Uri.parse('https://libretranslate.de/translate');
  try {
    final response = await http
        .post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'q': text,
            'source': 'auto',
            'target': 'bn',
          }),
        )
        .timeout(const Duration(seconds: 10)); // ⏱️ Timeout added

    if (response.statusCode == 200) {
      return json.decode(response.body)['translatedText'] ?? text;
    }
  } catch (e) {
    print('🔴 Translation API error: $e');
  }

  return text; // Fallback to original if failed
}

}