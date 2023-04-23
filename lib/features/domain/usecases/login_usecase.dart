import 'package:chemiplay/core/utils/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/services/auth_service.dart';
import '../../../core/utils/constants.dart';
import '../../data/models/user.dart';
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
      final googleAccount = await _googleSignIn.signIn();
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

  Future<bool> signInFirebase(GoogleSignInAccount account) async {
    try {
      final GoogleSignInAuthentication googleAuth =
          await account.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final user =
          await _authRepository.loginWithGoogle(credential.idToken ?? '');
      _authService.signIn(user);
      return true;
    } catch (e) {
      Logger.error(e);
      return false;
    }
  }
}
