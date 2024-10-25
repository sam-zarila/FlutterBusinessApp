import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../theme.dart';
import '../pages/signUp.dart';
import '../pages/bottomNavBar.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginUser(String name, String password, BuildContext context) async {
    final url = Uri.parse('http://10.0.2.2:3000/user/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      final accessToken = responseData['access_token'];
      print('Login successful: $accessToken');
      
      // Navigate to BottomNavBar after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavbar()),
      );
    } else {
      print('Login failed: ${response.body}');
      _showErrorDialog(context, 'Login failed. Please try again.');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome ", style: AppTheme.headline),
            SizedBox(height: 10),
            Text("Shop From anyWhere any Time.", style: AppTheme.subheadline),
            SizedBox(height: 30),
            _buildTextField(nameController, "Enter your username"),
            SizedBox(height: 10),
            _buildTextField(passwordController, "Enter your password", isPassword: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                loginUser(
                  nameController.text,
                  passwordController.text,
                  context,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.orange,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text("Login", style: AppTheme.buttonStyle),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              child: Text(
                'Don\'t have an account? Sign up'
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
