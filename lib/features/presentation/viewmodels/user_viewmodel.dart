import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/services/auth_service.dart';
import '../../data/models/user_model.dart';

class UserViewModel extends ChangeNotifier {
  final AuthService _authService;

  UserModel? _user;
  UserModel? get user => _user;

  bool get isAuthenticated => user != null;

  UserViewModel(this._authService) {
    _setUser();
    FirebaseAuth.instance.authStateChanges().listen((user) async {
      _setUser();
    });
  }

  void _setUser() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      _user = UserModel(
          id: currentUser.uid ?? '',
          email: currentUser.email ?? '',
          name: currentUser.displayName ?? '',
          profileImageUrl: currentUser.photoURL ?? '');
    }
    notifyListeners();
  }
}
