import '../../data/models/user.dart';

abstract class AuthRepository {
  Future<UserModel?> loginWithGoogle(String idToken);
}
