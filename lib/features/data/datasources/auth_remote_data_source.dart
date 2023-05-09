import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthRemoteDataSource(this._firebaseAuth);

  Future<User?> loginWithGoogle(String idToken) async {
    try {
      final OAuthCredential credential =
          GoogleAuthProvider.credential(idToken: idToken);
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      throw Exception('Failed to log in with Google: ${e.toString()}');
    }
  }
}
