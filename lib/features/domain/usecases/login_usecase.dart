import 'package:chemiplay/core/utils/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/services/auth_service.dart';
import '../../../core/utils/constants.dart';
import '../../data/models/user_model.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;
  final AuthService _authService;

  LoginUseCase(this._authRepository, this._authService);

  Future<UserModel?> loginWithGoogle() async {
    try {
      final googleUser =
          await GoogleSignIn(clientId: Constants.googleClientId).signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final user =
          await _authRepository.loginWithGoogle(credential.idToken ?? '');
      _authService.signIn(user);
      return user;
    } catch (e) {
      Logger.error(e);
      return null;
    }
  }
}
