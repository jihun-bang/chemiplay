import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class MateAudioViewModel extends ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();
  int _duration = 0;
  int _position = 0;
  String? _userId;
  String? get userId => _userId;

  MateAudioViewModel();

  init() {
    _player.onPlayerStateChanged.listen(_onPlayerStateChanged);
    _player.onDurationChanged.listen(_onDurationChanged);
    _player.onPositionChanged.listen(_onPositionChanged);
  }

  play({required String url, required String userId}) async {
    await _player.play(UrlSource(url));
    _userId = userId;
    notifyListeners();
  }

  pause() async {
    await _player.pause();
    _userId = null;
    notifyListeners();
  }

  _onPlayerStateChanged(PlayerState state) {
    if (state == PlayerState.completed) {
      _position = _duration;
      _userId = null;
      notifyListeners();
    }
  }

  _onDurationChanged(Duration duration) {
    _duration = duration.inMilliseconds;
  }

  _onPositionChanged(Duration position) {
    _position = position.inMilliseconds;
    notifyListeners();
  }
}
