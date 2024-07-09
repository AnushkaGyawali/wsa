import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/shake_service.dart';
import '../utils/hardware_buttons_service.dart';
import '../utils/camera_service.dart';
import '../utils/audio_service.dart';

class SosService {
  final ShakeService _shakeService = ShakeService();
  final HardwareButtonsService _hardwareButtonsService = HardwareButtonsService();
  final CameraService _cameraService = CameraService();
  final AudioService _audioService = AudioService();

  void initShakeDetector(Function onShake) {
    _shakeService.startListening(onShake);
  }

  void initHardwareButtonsListener(Function onButtonsPressed) {
    _hardwareButtonsService.startListening(onButtonsPressed);
  }

  void initCamera() {
    _cameraService.initialize();
  }

  void initAudioPlayer() {
    _audioService.initialize();
  }

  void sendSOS(Position? position) {
    if (position != null) {
      String message = "SOS! I need help. My location is: https://maps.google.com/?q=${position.latitude},${position.longitude}";
      launch("sms:+recipient_phone_number?body=$message");
    }
  }

  void startRecording() {
    _cameraService.startVideoRecording();
  }

  void playAlarm() {
    _audioService.playAlarm();
  }

  void dispose() {
    _shakeService.stopListening();
    _hardwareButtonsService.stopListening();
    _cameraService.dispose();
    _audioService.dispose();
  }
}
