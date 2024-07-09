import 'package:flutter/material.dart';
import 'Screens/Welcome/components/welcome_screen.dart';
import 'constants.dart';

void main() {
  runApp(WSAApp());
}

class WSAApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Women Safety App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
