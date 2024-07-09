import 'package:flutter/material.dart';
import 'auth_service.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(controller: _emailController, hintText: 'Email'),
            CustomTextField(controller: _passwordController, hintText: 'Password', obscureText: true),
            CustomButton(
              text: 'Sign Up',
              onPressed: () {
                _authService.signUp(_emailController.text, _passwordController.text);
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
