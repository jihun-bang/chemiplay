import 'package:chemiplay/data/extenstion/extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../data/models/user.dart';
import '../../domain/usecases/user_usecase.dart';

class UserViewModel extends ChangeNotifier {
  final UserUseCase _usecase;

  UserModel? _user;
  UserModel? get user => _user;

  bool get isAuthenticated => user != null;

  UserViewModel(this._usecase) {
    _init();
  }

  Future<void> _init() async {
    await _setUser();
    FirebaseAuth.instance.authStateChanges().listen((user) async {
      await _setUser();
    });
  }

  Future<void> _setUser() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final dbUser = await _usecase.getUser(id: currentUser.uid);
      if (dbUser == null) {
        final result = await _usecase.addUser(currentUser);
        _user = result ? currentUser.toUserModel() : null;
      } else {
        _user = dbUser;
      }
    } else {
      _user = null;
    }
    notifyListeners();
  }

  Future<bool> updateProfileImage(Uint8List imageFile) async {
    if (user != null) {
      final profileImageUrl =
          await _usecase.uploadImage(userId: user!.id, imageFile: imageFile);
      final result =
          await updateUser(user!.copyWith(profileImageUrl: profileImageUrl));
      if (result) {
        _user = user;
        notifyListeners();
      }
    }

    return false;
  }

  Future<bool> updateUser(UserModel user) async {
    final result = await _usecase.updateUser(user: user);
    if (result) {
      _user = user;
      notifyListeners();
    }
    return result;
  }
}
