import 'package:chemiplay/core/utils/logger.dart';
import 'package:chemiplay/features/data/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/utils/constants.dart';
import '../repositories/auth_repository.dart';
import '../repositories/user_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: Constants.googleClientId,
  );

  LoginUseCase(this._authRepository, this._userRepository);

  Future<User?> loginWithGoogle() async {
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
        if (user != null) {
          final dbUser = await _userRepository.getUser(id: user.uid);
          Logger.d('await _userRepository.getUser=${dbUser?.toJson()}');
          if (dbUser == null) {
            await _userRepository.addUser(
                user: UserModel(
                    id: user.uid,
                    email: user.email!,
                    name: user.displayName ?? user.uid,
                    profileImageUrl: user.photoURL,
                    phoneNumber: user.phoneNumber,
                    createdAt: DateTime.now(),
                    modifiedAt: DateTime.now()));
          }
        }
        return user;
      } else {
        return null;
      }
    } catch (e) {
      Logger.e(e);
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
      return true;
    } catch (e) {
      Logger.e(e);
      return false;
    }
  }
}
