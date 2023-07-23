import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class MateAudioViewModel extends ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();
  String? _userId;
  int _duration = 0;
  int _position = 0;
  String? get userId => _userId;
  int get duration => _duration;
  int get position => _position;

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
    _duration = duration.inSeconds;
  }

  _onPositionChanged(Duration position) {
    _position = position.inSeconds;
    notifyListeners();
  }

  String getLeftTime() {
    int totalLeftSecond = _duration - _position;
    int leftMinute = totalLeftSecond ~/ 60;
    int leftSecond = totalLeftSecond % 60;
    String getTwoDigitString(String stringNumber) {
      if (stringNumber.length == 1) {
        return '0$stringNumber';
      } else {
        return stringNumber;
      }
    }

    return '${getTwoDigitString(leftMinute.toString())}:${getTwoDigitString(leftSecond.toString())}';
  }
}
