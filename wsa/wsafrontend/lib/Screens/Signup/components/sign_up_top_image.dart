import 'package:flutter/material.dart';

class SignUpTopImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/signup_top.png",
      height: MediaQuery.of(context).size.height * 0.2,
    );
  }
}
