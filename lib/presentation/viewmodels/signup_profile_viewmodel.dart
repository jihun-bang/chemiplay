import 'package:chemiplay/data/models/user.dart';
import 'package:chemiplay/domain/usecases/user_usecase.dart';
import 'package:chemiplay/presentation/viewmodels/user_viewmodel.dart';
import 'package:flutter/foundation.dart';

class SignupProfileViewModel extends ChangeNotifier {
  final UserUseCase _userUseCase;
  final UserViewModel _userViewModel;

  SignupProfileViewModel(this._userUseCase, this._userViewModel);
  int _page = 0;
  bool _nextButtonDisabled = true;

  Gender? _gender;
  String? _nickname;
  Uint8List? _profileImage;

  int get page => _page;
  bool get nextButtonDisabled => _nextButtonDisabled;

  Gender? get gender => _gender;
  String? get nickname => _nickname;
  Uint8List? get profileImage => _profileImage;

  void setGender(Gender gender) {
    _gender = gender;
    notifyListeners();
  }

  void setNickname(String nickname) {
    _nickname = nickname;
    _nextButtonDisabled = !validateNickname(_nickname);
    notifyListeners();
  }

  bool validateNickname(String? nickname) {
    if (nickname == null || nickname.isEmpty) {
      return false;
    }
    return true;
  }

  void setProfileImage(Uint8List profileImage) {
    _profileImage = profileImage;
    notifyListeners();
  }

  Future<void> updateUserProfile() async {
    final user = _userViewModel.user!.copyWith(
      gender: _gender,
      name: _nickname,
    );
    await _userUseCase.updateUser(user: user);
  }

  Future<void> uploadProfileImage() async {
    if (_profileImage != null) {
      await _userViewModel.updateProfileImage(_profileImage!);
    }
  }

  setNextButtonDisabled(bool value) {
    _nextButtonDisabled = value;
    notifyListeners();
  }

  setPage(int value) {
    _page = value;
    notifyListeners();
  }
}
