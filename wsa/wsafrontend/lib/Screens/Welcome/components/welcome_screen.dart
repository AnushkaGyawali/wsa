import 'package:flutter/material.dart';
import 'welcome_image.dart';
import 'login_signup_btn.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          WelcomeImage(),
          LoginAndSignupBtn(),
        ],
      ),
    );
  }
}
