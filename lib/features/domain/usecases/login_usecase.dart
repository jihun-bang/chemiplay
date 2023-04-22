import 'package:chemiplay/core/utils/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/services/auth_service.dart';
import '../../../core/utils/constants.dart';
import '../../data/models/user_model.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;
  final AuthService _authService;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: Constants.googleClientId,
  );

  LoginUseCase(this._authRepository, this._authService);

  Future<UserModel?> loginWithGoogle() async {
    try {
      GoogleSignInAccount? googleAccount;
      if (kIsWeb) {
        googleAccount = await _googleSignIn.signInSilently() ??
            await _googleSignIn.signIn();
      } else {
        googleAccount = await _googleSignIn.signIn();
      }
      if (googleAccount != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleAccount.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final user =
            await _authRepository.loginWithGoogle(credential.idToken ?? '');
        _authService.signIn(user);
        return user;
      } else {
        return null;
      }
    } catch (e) {
      Logger.error(e);
      return null;
    }
  }
}
