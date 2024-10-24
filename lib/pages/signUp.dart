import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme.dart';


class SignUpPage extends StatelessWidget {
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
            Text("Start your journey today.", style: AppTheme.subheadline),
            SizedBox(height: 30),
            _buildTextField("Enter your email"),
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
              child: Text("Create Your Account", style: AppTheme.buttonStyle),
            ),
            SizedBox(height: 20),
            Text("or"),
            SizedBox(height: 10),
            _buildSocialButtons(),
            SizedBox(height: 20),
            Text("Already have an account? Sign in."),
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

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: FaIcon(FontAwesomeIcons.google),
          onPressed: () {},
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.facebook),
          onPressed: () {},
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.apple),
          onPressed: () {},
        ),
      ],
    );
  }
}