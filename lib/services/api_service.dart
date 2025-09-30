import 'dart:convert';
import 'package:http/http.dart' as http;
import '../ models/user_model.dart';


class ApiService {
  final String baseUrl = 'https://restful-api.dev/api/v1';

  Future<List<UserModel>> fetchUsers() async {
    final url = Uri.parse('$baseUrl/users');
    final res = await http.get(url).timeout(Duration(seconds: 10));
    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      if (data is List) {
        return data.map((e) => UserModel.fromJson(e)).toList();
      } else if (data is Map && data['data'] is List) {
        return (data['data'] as List).map((e) => UserModel.fromJson(e)).toList();
      } else {
        throw Exception('Unexpected response');
      }
    } else {
      throw Exception('Failed to load users: ${res.statusCode}');
    }
  }
}
