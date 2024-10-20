// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import '../models/adminModel.dart';
// import '../services/admin.Login.dart';
// import './homepage.dart'; // Import the homepage

// class AdminLogin extends StatefulWidget {
//   const AdminLogin({super.key});

//   @override
//   State<AdminLogin> createState() => _AdminLoginState();
// }

// class _AdminLoginState extends State<AdminLogin> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final AuthService _authService = AuthService();

//   bool _isLoading = false;
//   String _errorMessage = '';

//   Future<void> _login() async {
//     setState(() {
//       _isLoading = true;
//       _errorMessage = '';
//     });

//     final username = _usernameController.text.trim();
//     final password = _passwordController.text.trim();

//     if (username.isEmpty || password.isEmpty) {
//       setState(() {
//         _errorMessage = 'Please enter password and username';
//         _isLoading = false;
//       });
//       return;
//     }

//     final Admin = Adminmodel(username: username, password: password);
//     final authResponse = await _authService.login(Admin); // Call the login method

//     if (authResponse != null) {
//       // Navigate to the homepage after successful login
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const HomePage()), // Navigate to HomePage
//       );
//     } else {
//       setState(() {
//         _errorMessage = 'Login failed. Please check your credentials.';
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Login')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _usernameController,
//               decoration: const InputDecoration(labelText: 'Username'),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: const InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             const SizedBox(height: 20),
//             if (_errorMessage.isNotEmpty)
//               Text(
//                 _errorMessage,
//                 style: const TextStyle(color: Colors.red),
//               ),
//             const SizedBox(height: 20),
//             _isLoading
//                 ? const CircularProgressIndicator()
//                 : ElevatedButton(
//                     onPressed: _login,
//                     child: const Text('Login'),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AuthService {
// }

// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import '../models/adminModel.dart';
import '../services/admin.Login.dart';
import './homepage.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<AdminLogin> {
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

    final user = Adminmodel(username: username, password: password);
    final response = await _authService.login(user);

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
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _login,
                    child: const Text('Login'),
                  ),
          ],
        ),
      ),
    );
  }
}
