import 'package:chemiplay/data/extenstion/extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../data/models/user.dart';
import '../../utils/constants.dart';
import '../../utils/logger.dart';
import '../repositories/auth_repository.dart';
import '../repositories/user_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: Constants.googleClientId,
  );

  LoginUseCase(this._authRepository, this._userRepository);

  Future<UserModel?> loginWithGoogle({GoogleSignInAccount? account}) async {
    try {
      GoogleSignInAuthentication? googleAuth = await account?.authentication;
      if (googleAuth == null) {
        final google = await _googleSignIn.signIn();
        googleAuth = await google?.authentication;
      }
      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final userCredential =
            await _authRepository.loginWithGoogle(credential.idToken ?? '');
        final user = userCredential.user;
        if (user != null) {
          UserModel? dbUser = await _userRepository.getUser(id: user.uid);
          if (dbUser == null) {
            final newUser = user.toUserModel();
            final addResult = await _userRepository.addUser(user: newUser);
            if (!addResult) {
              return null;
            } else {
              dbUser = newUser;
            }
          }
          await FirebaseAuth.instance.signOut();
          await FirebaseAuth.instance
              .signInWithCredential(userCredential.credential!);
          return dbUser;
        }
      }
      return null;
    } catch (e) {
      Logger.e(e);
      return null;
    }
  }
}
