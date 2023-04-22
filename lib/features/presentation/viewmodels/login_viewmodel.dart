import 'package:flutter/material.dart';

import '../../../core/services/auth_service.dart';
import '../../domain/usecases/login_usecase.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthService _authService;
  final LoginUseCase _loginUseCase;

  LoginViewModel(this._authService, this._loginUseCase);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loginWithGoogle() async {
    _setIsLoading(true);
    await _loginUseCase.loginWithGoogle();
    _setIsLoading(false);
  }

  void _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
