import 'package:shake/shake.dart';

class ShakeService {
  late ShakeDetector _shakeDetector;

  void startListening(Function() onShake) {
    _shakeDetector = ShakeDetector.autoStart(onPhoneShake: onShake);
  }

  void stopListening() {
    _shakeDetector.stopListening();
  }
}
