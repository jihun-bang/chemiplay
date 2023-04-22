import '../../features/data/models/user_model.dart';

class AuthService {
  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  bool get isAuthenticated => _currentUser != null;

  void signIn(UserModel? user) {
    _currentUser = user;
  }

  void signOut() {
    _currentUser = null;
  }
}
