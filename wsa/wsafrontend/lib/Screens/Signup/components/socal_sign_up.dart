import 'package:flutter/material.dart';
import 'social_icon.dart';

class SocialSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SocialIcon(
          iconSrc: "assets/icons/facebook.svg",
          press: () {},
        ),
        SocialIcon(
          iconSrc: "assets/icons/twitter.svg",
          press: () {},
        ),
        SocialIcon(
          iconSrc: "assets/icons/google-plus.svg",
          press: () {},
        ),
      ],
    );
  }
}
