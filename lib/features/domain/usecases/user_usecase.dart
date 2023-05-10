import 'package:chemiplay/features/data/extenstion/extension.dart';
import 'package:chemiplay/features/domain/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../data/models/user.dart';

class UserUseCase {
  final UserRepository _repository;

  UserUseCase(this._repository);

  Future<bool> addUser(User user) async {
    return await _repository.addUser(user: user.toUserModel());
  }

  Future<UserModel?> getUser({required String id}) async {
    return await _repository.getUser(id: id);
  }

  Future<bool> updateUser({required UserModel user}) async {
    return await _repository.updateUser(user: user);
  }
}
