// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import '../models/adminModel.dart' as model;
import '../services/admin.Login.dart';
import './homepage.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  String _errorMessage = '';

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter your username and password.';
        _isLoading = false;
      });
      return;
    }

    final user = model.Adminmodel(username: username, password: password);
    final response = await _authService.login(user as Adminmodel);

    setState(() {
      _isLoading = false;
    });

    if (response != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      setState(() {
        _errorMessage = 'Login failed. Please check your credentials.';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background to black
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Title
              const Text(
                'Admin Login',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent, // Title color in blue
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 50),

              // Username Field
              _buildTextField(
                controller: _usernameController,
                label: 'Username',
                icon: Icons.person,
              ),
              const SizedBox(height: 20),

              // Password Field
              _buildTextField(
                controller: _passwordController,
                label: 'Password',
                icon: Icons.lock,
                obscureText: true,
              ),
              const SizedBox(height: 40),

              // Error Message
              if (_errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    _errorMessage,
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ),

              // Login Button or Loading Indicator
              _isLoading
                  ? const CircularProgressIndicator()
                  : _buildSignInButton(),

              const SizedBox(height: 20),

              // Forgot Password Option
              
            ],
          ),
        ),
      ),
    );
  }

  // Method to build a custom text field with a rounded Apple-style
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(
          color: Colors.white), // White text on black background
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.blueAccent), // Icon in blue
        labelText: label,
        labelStyle:
            const TextStyle(color: Colors.blueAccent), // Label text in blue
        filled: true,
        fillColor: Colors.grey[900], // Dark grey background for text field
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.blueAccent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey[700]!),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
      ),
    );
  }

  // Method to build the Sign In button
  Widget _buildSignInButton() {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        onPressed: _login,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent, // Button in blue
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 5.0,
        ),
        child: const Text(
          'Sign In',
          style: TextStyle(
            color: Colors.white, // White text on blue button
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
