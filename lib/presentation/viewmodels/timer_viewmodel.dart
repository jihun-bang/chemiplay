import 'dart:async';

import 'package:flutter/foundation.dart';

class TimerViewModel extends ChangeNotifier {
  late final int _totalSeconds;
  late final VoidCallback? _onFinished;

  init({required int totalSeconds, VoidCallback? onFinished}) {
    _totalSeconds = totalSeconds;
    _onFinished = onFinished;
  }

  late int _timerSecond = _totalSeconds;
  int get timerSecond => _timerSecond;

  Timer? _timer;

  void resetAndStartTimer() {
    pauseTimer();
    resetTimer();
    startTimer();
  }

  void startTimer() {
    if (_timer != null) {
      if (_timer!.isActive) {
        throw Exception('Need to stop timer first');
      }
    }
    _timer = Timer.periodic(const Duration(seconds: 1), _onTick);
    notifyListeners();
  }

  void pauseTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      notifyListeners();
    }
  }

  void resetTimer() {
    if (_timer != null && _timer!.isActive) {
      throw Exception('Timer is still in running');
    }
    _timerSecond = _totalSeconds;
    notifyListeners();
  }

  void _onTick(Timer timer) {
    _timerSecond -= 1;
    notifyListeners();
    if (_timerSecond == 0) {
      timer.cancel();
      if (_onFinished != null) {
        _onFinished!();
      }
    }
  }

  @override
  void dispose() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    super.dispose();
  }
}
