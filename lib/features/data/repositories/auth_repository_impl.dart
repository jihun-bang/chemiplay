import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  Future<UserCredential> loginWithGoogle(String idToken) async {
    return await _authRemoteDataSource.loginWithGoogle(idToken);
  }
}
