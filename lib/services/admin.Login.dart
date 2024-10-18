import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/adminModel.dart';

class AuthService {
  final String baseUrl = 'http://10.0.2.2:3000/admin';

  Future<AuthResponse?> login(Adminmodel user) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(user.toJson()),
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
         final 
      } else {}
    } catch (e) {}
  }
}
