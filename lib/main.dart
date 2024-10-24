import 'package:flutter/material.dart';
import 'theme.dart';
import './pages/LoginPage.dart';
import './pages/signUp.dart';
// import './pages/bottomNavBar.dart';

void main() {
  runApp(MaterialApp(
    theme: AppTheme.theme,
    initialRoute: '/',
    routes: {
      '/': (context) => LoginPage(),
      '/signup': (context) => SignUpPage(),
      // '/bottomnavbar': (context) => BottomNavbar(),
    },
    
   
    // home:BottomNavbar (),
  ));
}

 