import 'package:flutter/foundation.dart';

class MateTogetherViewModel extends ChangeNotifier {
  int _costPerMatch = 0;
  int get costPerMatch => _costPerMatch;

  int _theNumberOfTime = 1;
  int get theNumberOfTime => _theNumberOfTime;

  init({required int costPerMatch, int theNumberOfTime = 1}) {
    _costPerMatch = costPerMatch;
    _theNumberOfTime = theNumberOfTime;
    notifyListeners();
  }

  final int _minimumTime = 1;
  final int _maximumTime = 99;

  void increseTime() {
    if (isMaximumTime) {
      _theNumberOfTime = _maximumTime;
      return;
    }
    _theNumberOfTime++;
    notifyListeners();
  }

  void decreseTime() {
    if (isMinimumTime) {
      _theNumberOfTime = _minimumTime;
      return;
    }
    _theNumberOfTime--;
    notifyListeners();
  }

  bool get isMinimumTime => _theNumberOfTime <= _minimumTime;
  bool get isMaximumTime => _theNumberOfTime >= _maximumTime;
}
