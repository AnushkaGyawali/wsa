import 'package:flutter/material.dart';

class LoginScreenTopImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/login_top.png",
      height: MediaQuery.of(context).size.height * 0.2,
    );
  }
}
