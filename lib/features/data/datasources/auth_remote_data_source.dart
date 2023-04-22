import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthRemoteDataSource(this._firebaseAuth);

  Future<UserModel?> loginWithGoogle(String idToken) async {
    try {
      final OAuthCredential credential =
          GoogleAuthProvider.credential(idToken: idToken);
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      final firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        return UserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email!,
          name: firebaseUser.displayName!,
          profileImageUrl: firebaseUser.photoURL,
        );
      } else {
        throw Exception('Failed to retrieve Firebase user.');
      }
    } catch (e) {
      throw Exception('Failed to log in with Google: ${e.toString()}');
    }
  }
}
