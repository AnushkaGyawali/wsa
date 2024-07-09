import 'package:volume_watcher/volume_watcher.dart';

class HardwareButtonsService {
  int _volumeUpPressCount = 0;
  int _volumeDownPressCount = 0;

  void startListening(Function onButtonsPressed) {
    VolumeWatcher.addListener((volume) {
      if (volume == VolumeDirection.Up) {
        _volumeUpPressCount++;
      } else if (volume == VolumeDirection.Down) {
        _volumeDownPressCount++;
      }

      if (_volumeUpPressCount >= 3 && _volumeDownPressCount >= 3) {
        onButtonsPressed();
        _resetCounts();
      }
    });
  }

  void _resetCounts() {
    _volumeUpPressCount = 0;
    _volumeDownPressCount = 0;
  }

  void stopListening() {
    VolumeWatcher.removeListener();
  }
}
