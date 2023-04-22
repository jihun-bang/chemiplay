import '../../data/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel?> loginWithGoogle(String idToken);
}
