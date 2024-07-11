import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () => onPressed(),
        child: Text(text),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50), // Full width button
          textStyle: TextStyle(fontSize: 18), // Larger text for better readability
        ),
      ),
    );
  }
}
