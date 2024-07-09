import 'package:audioplayers/audioplayers.dart';

class AudioService {
  late AudioPlayer _audioPlayer;

  void initialize() {
    _audioPlayer = AudioPlayer();
  }

  void playAlarm() {
    _audioPlayer.play('path_to_alarm_sound.mp3', isLocal: true);
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}
