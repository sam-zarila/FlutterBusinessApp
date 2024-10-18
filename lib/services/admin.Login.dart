import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/adminModel.dart';

class AuthService {
 final String baseUrl = 'http://127.0.0.1:3000/admin';


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
        final authResponse = AuthResponse.fromJson(json);
         
          final prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwtToken', authResponse.token);

        return authResponse;

        
      } else {
        throw Exception('Failed to login. Invalid credentials.');
      }
    } catch (e) {
      print('Login error: $e');
      return null;

    }
  }
 Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwtToken');
  }

  Future<bool> isAuthenticated() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwtToken') != null;
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwtToken');
  }


}
