import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer _audioPlayer = AudioPlayer();

  void playAlarmSound() {
    _audioPlayer.play(UrlSource('path_to_alarm_sound.mp3'));
  }

  void stopAlarmSound() {
    _audioPlayer.stop();
  }
}
