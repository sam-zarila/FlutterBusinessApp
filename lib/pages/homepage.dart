// pages/home_page.dart
import 'package:flutter/material.dart';
import '../services/admin.Login.dart';

// class HomePage extends StatelessWidget {
//   final AuthService _authService = AuthService();

//   Future<void> _logout(BuildContext context) async {
//     await _authService.logout();
//     Navigator.pushReplacementNamed(context, '/');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () => _logout(context),
//           ),
//         ],
//       ),
//       body: Center(
//         child: Text('Welcome to the Home Page!'),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home'),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Admin Home Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
