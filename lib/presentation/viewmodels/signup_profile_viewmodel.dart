import 'package:chemiplay/data/models/user.dart';
import 'package:chemiplay/domain/usecases/user_usecase.dart';
import 'package:chemiplay/presentation/viewmodels/user_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class SignupProfileViewModel extends ChangeNotifier {
  final UserUseCase _userUseCase;
  final UserViewModel _userViewModel;

  SignupProfileViewModel(this._userUseCase, this._userViewModel);
  int _page = 0;
  bool _nextButtonDisabled = true;

  Gender? _gender;
  String? _nickname;
  XFile? _profileImage;

  int get page => _page;
  bool get nextButtonDisabled => _nextButtonDisabled;

  Gender? get gender => _gender;
  String? get nickname => _nickname;
  XFile? get profileImage => _profileImage;

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

  void setProfileImage(XFile profileImage) {
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

  Future<void> uploadProfileImage() async {}

  setNextButtonDisabled(bool value) {
    _nextButtonDisabled = value;
    notifyListeners();
  }

  setPage(int value) {
    _page = value;
    notifyListeners();
  }
}
