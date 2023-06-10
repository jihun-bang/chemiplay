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

  void increseTime() {
    if (isMaximumTime) {
      return;
    }
    _theNumberOfTime++;
    notifyListeners();
  }

  void decreseTime() {
    if (isMinimumTime) {
      return;
    }
    _theNumberOfTime--;
    notifyListeners();
  }

  bool get isMinimumTime => _theNumberOfTime == 1;
  bool get isMaximumTime => _theNumberOfTime == 99;
}
