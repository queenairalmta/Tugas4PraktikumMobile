import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tugas4/article_model.dart';

class ApiService {
  Future<List<Article>> fetchArticles() async {
    final url = Uri.parse(
      'https://newsapi.org/v2/everything?q=apple&from=2026-10-18&to=2026-10-18&sortBy=popularity&apiKey=589f26cc01f64da786167d1f79fac595',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List articles = json['articles'];

      return articles.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Gagal mengambil berita');
    }
  }
}
