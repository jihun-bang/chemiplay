import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class SignupProfileViewModel extends ChangeNotifier {
  String? _gender;
  String? _nickname;
  XFile? _profileImage;
  String? get gender => _gender;
  String? get nickname => _nickname;
  XFile? get profileImage => _profileImage;

  setGender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  setNickname(String nickname) {
    _nickname = nickname;
    notifyListeners();
  }

  validateNickname(String? nickname) {
    if (nickname == null || nickname.isEmpty) {
      return false;
    }
    return true;
  }

  setProfileImage(XFile profileImage) {
    _profileImage = profileImage;
    notifyListeners();
  }
}
