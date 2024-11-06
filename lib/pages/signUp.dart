import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../theme.dart';
import '../pages/LoginPage.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> registerUser(String name, String email, String password, BuildContext context) async {
    final url = Uri.parse('http://127.0.0.1:3000/user/register');

    // Input validation
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _showErrorDialog(context, 'Please fill in all fields.');
      return;
    }

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      // Debugging output
      print('Request Body: ${jsonEncode({
        'name': name,
        'email': email,
        'password': password,
      })}');
      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 201) {
        print('User registered successfully: ${response.body}');
        // Navigate to the login page after successful registration
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => false, // Remove all previous routes
        );
      } else {
        final errorResponse = jsonDecode(response.body);
        print('Registration failed: ${response.statusCode} - ${errorResponse['message'] ?? 'Unknown error'}');
        _showErrorDialog(context, 'Registration failed: ${errorResponse['message'] ?? 'Please try again.'}');
      }
    } catch (error) {
      print('Registration error: $error');
      _showErrorDialog(context, 'An error occurred. Please try again.');
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
            Text("Welcome!", style: AppTheme.headline),
            SizedBox(height: 10),
            Text("Experience Seamless Mobile Shopping.", style: AppTheme.subheadline),
            SizedBox(height: 30),
            _buildTextField(nameController, "Enter your name"),
            SizedBox(height: 30),
            _buildTextField(emailController, "Enter your email"),
            SizedBox(height: 10),
            _buildTextField(passwordController, "Enter your password", isPassword: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                registerUser(
                  nameController.text,
                  emailController.text,
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
              child: Text("Create Your Account", style: AppTheme.buttonStyle),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Already have an account? Login'),
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
