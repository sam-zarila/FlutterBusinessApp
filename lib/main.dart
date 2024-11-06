import 'package:business/pages/BusinessPage.dart';
import 'package:flutter/material.dart';
import 'theme.dart';
//import './pages/LoginPage.dart';
import './pages/signUp.dart';
// import './pages/bottomNavBar.dart';

void main() {
  // Ensure the binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    theme: AppTheme.theme,
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/signup': (context) => SignUpPage(),
      // '/bottomnavbar': (context) => BottomNavbar(),
    },
    // home: BottomNavbar(), // Uncomment this if you plan to use BottomNavbar as the home
  ));
}
