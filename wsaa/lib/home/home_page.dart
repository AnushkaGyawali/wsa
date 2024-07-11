import 'package:flutter/material.dart';
import '../utils/shake_service.dart';
import '../utils/hardware_buttons_service.dart';
import '../utils/audio_service.dart';
import 'sos_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ShakeService _shakeService = ShakeService();
  final HardwareButtonsService _hardwareButtonsService = HardwareButtonsService();
  final SOSService _sosService = SOSService();
  final AudioService _audioService = AudioService();

  @override
  void initState() {
    super.initState();

    // Start listening to shake events
    _shakeService.startListening(() {
      _sosService.handleSOS(context);
    });

    // Start listening to hardware buttons events
    _hardwareButtonsService.startListening((VolumeButtonEvent event) {
      if (event == VolumeButtonEvent.VOLUME_UP || event == VolumeButtonEvent.VOLUME_DOWN) {
        _sosService.handleSOS(context);
      }
    });
  }

  @override
  void dispose() {
    _shakeService.stopListening();
    _hardwareButtonsService.stopListening();
    _sosService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _audioService.playAlarmSound();
          },
          child: Text('Play Alarm'),
        ),
      ),
    );
  }
}
