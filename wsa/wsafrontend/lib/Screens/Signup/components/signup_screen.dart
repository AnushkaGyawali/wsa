import 'package:flutter/material.dart';
import 'signup_form.dart';
import 'sign_up_top_image.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SignUpTopImage(),
            SignUpForm(),
          ],
        ),
      ),
    );
  }
}
