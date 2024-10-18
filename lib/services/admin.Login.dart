import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/adminModel.dart';


class AuthService{
  final String baseUrl = 'http://10.0.2.2:3000/admin';

  Future<AuthResponse?>
}