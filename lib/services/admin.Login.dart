// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/adminModel.dart';

class AuthService {
  final String baseUrl = 'http://127.0.0.1:3000/admin';

  // Method for logging in an admin
  Future<AuthResponse?> login(Adminmodel user) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/signIn'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(user.toJson()),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        final json = jsonDecode(response.body);

        // Check if token exists and is a valid string
        if (json['access_token'] != null && json['access_token'] is String) {
          final authResponse = AuthResponse.fromJson(json);

          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('jwtToken', authResponse.token);

          return authResponse;
        } else {
          print('Token is null or not a string');
          throw Exception('Token is missing in the response.');
        }
      } else {
        throw Exception(
          'Failed to login. Status Code: ${response.statusCode}. Response Body: ${response.body}',
        );
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
