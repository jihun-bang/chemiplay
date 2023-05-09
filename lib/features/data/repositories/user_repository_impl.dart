import 'package:chemiplay/features/data/datasources/firebase_database.dart';

import '../../../core/utils/logger.dart';
import '../../domain/repositories/user_repository.dart';
import '../models/user.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseDatabase _firebaseDatabase;

  UserRepositoryImpl(this._firebaseDatabase);

  @override
  Future<bool> addUser({required UserModel user}) async {
    try {
      Logger.d('add ${user.toJson()}');
      return await _firebaseDatabase.addUser(user: user);
    } catch (e) {
      Logger.e(e);
      return false;
    }
  }

  @override
  Future<UserModel?> getUser({required String id}) async {
    try {
      return await _firebaseDatabase.getUser(id: id);
    } catch (e, stacktrace) {
      Logger.e(e, null, stacktrace);
      return null;
    }
  }

  @override
  Future<bool> updateUser({required UserModel user}) async {
    try {
      return await _firebaseDatabase.updateUser(user: user);
    } catch (e, stacktrace) {
      Logger.e(e, null, stacktrace);
      return false;
    }
  }
}
