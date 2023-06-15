import 'package:chemiplay/presentation/viewmodels/user_viewmodel.dart';
import 'package:flutter/foundation.dart';

import '../../data/models/user.dart';

class MyMateProfileViewModel extends ChangeNotifier {
  final UserViewModel _userViewModel;

  UserModel? get user => _userViewModel.user;

  MyMateProfileViewModel(this._userViewModel);
  late String? _nickname = user?.name;
  String? get nickname => _nickname;

  late Gender? _gender = user?.gender;
  Gender? get gender => _gender;

  late String? _birthday = user?.birthday;
  String? get birthday => _birthday;

  late String? _introduction = user?.birthday;
  String? get introduction => _introduction;

  setNickname(String newNickname) {
    _nickname = newNickname;
    notifyListeners();
  }

  setGender(Gender newGender) {
    _gender = newGender;
    notifyListeners();
  }

  setBirthday(String newBirthday) {
    _birthday = newBirthday;
    notifyListeners();
  }

  setIntroduction(String newIntroduction) {
    _introduction = newIntroduction;
    notifyListeners();
  }
}
