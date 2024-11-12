
//import 'package:business/pages/BusinessPage.dart';
import 'package:flutter/material.dart';
import 'theme.dart';
//import './pages/signUp.dart';
import './pages/bottomNavBar.dart'; // Import BottomNavbar

void main() {
  // Ensure the binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    theme: AppTheme.theme,
    // Set BottomNavbar as the main entry widget
    home: BottomNavbar(), 
    // routes: {
    //   '/signup': (context) => SignUpPage(),
    // },
  ));
}
