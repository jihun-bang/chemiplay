import 'package:chemiplay/features/data/extenstion/extension.dart';
import 'package:chemiplay/features/domain/usecases/user_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../data/models/user.dart';

class UserViewModel extends ChangeNotifier {
  final UserUseCase _usecase;

  UserModel? _user;
  UserModel? get user => _user;

  bool get isAuthenticated => user != null;

  UserViewModel(this._usecase) {
    _setUser();
    FirebaseAuth.instance.authStateChanges().listen((user) async {
      _setUser();
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
}
