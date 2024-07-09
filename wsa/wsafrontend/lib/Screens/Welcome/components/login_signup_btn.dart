import 'package:flutter/material.dart';
import '../../Login/components/login_screen.dart';
import '../../Signup/components/signup_screen.dart';

class LoginAndSignupBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LoginScreen();
                },
              ),
            );
          },
          child: Text("Login".toUpperCase()),
        ),
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SignUpScreen();
                },
              ),
            );
          },
          child: Text("Signup".toUpperCase()),
        ),
      ],
    );
  }
}
