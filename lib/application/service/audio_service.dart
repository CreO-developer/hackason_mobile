import 'package:audioplayers/audioplayers.dart';

class AudioPlayerService {
  final AudioPlayer _audioPlayer = AudioPlayer();

  void playBackgroundMusic(String assetPath) async {
    await _audioPlayer.setVolume(0.5); // Set volume (0.0 to 1.0)
    await _audioPlayer.setReleaseMode(ReleaseMode.loop); // Loop the audio
    await _audioPlayer.play(AssetSource(assetPath));
  }

  void stopBackgroundMusic() async {
    await _audioPlayer.stop();
  }
}
