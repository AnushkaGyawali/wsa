import 'package:volume_watcher/volume_watcher.dart';

class HardwareButtonsService {
  int _lastVolumeLevel = 0;

  void startListening(Function(VolumeButtonEvent) onButtonEvent) {
    VolumeWatcher.addListener((volume) {
      if (volume > _lastVolumeLevel) {
        // Volume increased, handle volume up event
        onButtonEvent(VolumeButtonEvent.VOLUME_UP);
      } else if (volume < _lastVolumeLevel) {
        // Volume decreased, handle volume down event
        onButtonEvent(VolumeButtonEvent.VOLUME_DOWN);
      }
      _lastVolumeLevel = volume; // Update the last known volume level
    });
  }

  void stopListening() {
    VolumeWatcher.removeListener(0); // Replace with the appropriate listener ID
  }
}

enum VolumeButtonEvent {
  VOLUME_UP,
  VOLUME_DOWN,
}
