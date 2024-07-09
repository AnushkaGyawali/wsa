import 'package:flutter/material.dart';
import 'login_form.dart';
import 'login_screen_top_image.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            LoginScreenTopImage(),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
