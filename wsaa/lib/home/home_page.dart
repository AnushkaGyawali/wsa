import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/shake_service.dart';
import '../utils/hardware_buttons_service.dart';
import '../utils/camera_service.dart';
import '../utils/audio_service.dart';
import '../widgets/map_widget.dart';
import 'sos_service.dart';
import '../auth/auth_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _sosService = SosService();
  GoogleMapController? _mapController;
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _sosService.initShakeDetector(_triggerSOS);
    _sosService.initHardwareButtonsListener(_triggerSOS);
    _sosService.initCamera();
    _sosService.initAudioPlayer();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    _currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {});
  }

  void _triggerSOS() {
    _sosService.sendSOS(_currentPosition);
    _sosService.startRecording();
    _sosService.playAlarm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WSAA'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              AuthService().signOut();
            },
          ),
        ],
      ),
      body: _currentPosition == null
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Expanded(
            child: MapWidget(
              initialPosition: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
              onMapCreated: (controller) {
                _mapController = controller;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _triggerSOS,
              child: Text('SOS Button'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _sosService.dispose();
    super.dispose();
  }
}
