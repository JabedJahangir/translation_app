import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';
import 'package:translated_api_app/data/model/post_model.dart';

class PostRepository {
  final translator = GoogleTranslator(); // unofficial translator

  
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

  // Translate to Bangla using unofficial Google Translate
  Future<String> translateToBangla(String text) async {
    try {
      final result = await translator.translate(text, to: 'bn');
      return result.text;
    } catch (e) {
      print('🔴 Translation failed: $e');
      return text; // fallback
    }
  }
}
