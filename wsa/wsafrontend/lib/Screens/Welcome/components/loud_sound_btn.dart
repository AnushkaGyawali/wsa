import 'package:flutter/material.dart';

class LoudSoundBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // Implement your logic here
      },
      icon: Icon(Icons.volume_up),
      label: Text("Turn On Loud Alarm"),
      style: ElevatedButton.styleFrom(
        primary: kPrimaryColor,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
