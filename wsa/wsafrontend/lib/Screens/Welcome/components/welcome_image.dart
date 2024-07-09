import 'package:flutter/material.dart';

class WelcomeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/welcome.png",
      height: MediaQuery.of(context).size.height * 0.45,
    );
  }
}
