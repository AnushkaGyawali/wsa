import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/camera_service.dart';
import '../utils/audio_service.dart';

class SOSService {
  final CameraService _cameraService = CameraService();
  final AudioService _audioService = AudioService();

  Future<void> handleSOS(BuildContext context) async {
    // Start video recording
    await _cameraService.startVideoRecording();

    // Play alarm sound
    _audioService.playAlarmSound();

    // Get current location
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    // Save to Firestore or send SOS message
    FirebaseFirestore.instance.collection('sos').add({
      'latitude': position.latitude,
      'longitude': position.longitude,
      'timestamp': Timestamp.now(),
    });

    // Implement additional SOS logic here
  }

  void dispose() {
    _cameraService.dispose();
    _audioService.stopAlarmSound();
  }
}
