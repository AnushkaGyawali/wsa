import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class SosScreen extends StatelessWidget {
  Future<void> _sendSOS() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    // Implement logic to send SOS with the position
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Send SOS')),
      body: Center(
        child: ElevatedButton(
          onPressed: _sendSOS,
          child: Text('Send SOS'),
        ),
      ),
    );
  }
}
