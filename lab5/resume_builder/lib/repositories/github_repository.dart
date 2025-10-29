import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/github_user.dart';

class GitHubRepository {
  final String baseUrl = 'https://api.github.com/users';

  Future<GitHubUser> fetchUser(String username) async {
    final url = Uri.parse('$baseUrl/$username');
    final resp = await http.get(url);
    if (resp.statusCode == 200) {
      final json = jsonDecode(resp.body) as Map<String, dynamic>;
      return GitHubUser.fromJson(json);
    } else {
      throw Exception('GitHub user not found (${resp.statusCode})');
    }
  }
}