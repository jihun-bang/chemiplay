import 'package:flutter/material.dart';

import '../../domain/usecases/login_usecase.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<bool> loginWithGoogle() async {
    _setIsLoading(true);
    final result = await _loginUseCase.loginWithGoogle();
    _setIsLoading(false);
    return result != null;
  }

  void _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
