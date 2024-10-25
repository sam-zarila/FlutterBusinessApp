import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme.dart';
import '../pages/signUp.dart';

class LoginPage extends StatelessWidget {
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
            _buildTextField("Enter your username"),
            SizedBox(height: 10),
            _buildTextField("Enter your password", isPassword: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.orange,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text("Login", style: AppTheme.buttonStyle),
            ),
            SizedBox(height: 20),
            Text("Issues with your login?"),
            SizedBox(height: 20),
            Text("or"),
            SizedBox(height: 10),
          
            SizedBox(height: 20),
           TextButton(
            onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpPage()));
              
            },
            child: Text(
              'Don\'t have an account? Sign up'
            ),
           )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {bool isPassword = false}) {
    return TextField(
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
