import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> loginWithGoogle(String idToken);
}
