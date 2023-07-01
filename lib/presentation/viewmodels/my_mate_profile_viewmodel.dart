import 'package:chemiplay/presentation/viewmodels/user_viewmodel.dart';
import 'package:flutter/foundation.dart';

import '../../data/models/user.dart';

class MyMateProfileViewModel extends ChangeNotifier {
  final UserViewModel _userViewModel;
  final DateTime now = DateTime.now();
  late final DateTime minBirthDay = DateTime(now.year - 19, now.month, now.day);

  UserModel? get user => _userViewModel.user;

  MyMateProfileViewModel(this._userViewModel);
  late String? _nickname = user?.name;
  String? get nickname => _nickname;
  late String? _birthday = user?.birthday;
  String? get birthday => _birthday;

  late String? _introduction = user?.birthday;
  String? get introduction => _introduction;

  void setNickname(String newNickname) {
    _nickname = newNickname;
    notifyListeners();
  }

  void setBirthday(String newBirthday) {
    _birthday = newBirthday;
    notifyListeners();
  }

  void setIntroduction(String newIntroduction) {
    _introduction = newIntroduction;
    notifyListeners();
  }

  bool validateBirthday() {
    if (_birthday != null) {
      final result = DateTime.parse(_birthday!).isBefore(minBirthDay);
      return result;
    }
    return false;
  }

  bool isReadyToUpdate() {
    if (_nickname == null || _nickname!.isEmpty) return false;
    if (_birthday == null) return false;
    if (validateBirthday() == false) return false;
    if (_introduction == null || _introduction!.isEmpty) return false;
    return true;
  }

  Future updateModificationOnDB() async {
    if (_userViewModel.user == null) {
      throw Exception('User is not loged in');
    }
    final user = _userViewModel.user!.copyWith(
      name: _nickname,
      birthday: _birthday,
      introduction: _introduction,
    );
    await _userViewModel.updateUser(user);
  }
}
