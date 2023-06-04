import '../../data/models/user.dart';

abstract class UserRepository {
  Future<bool> addUser({required UserModel user});
  Future<UserModel?> getUser({required String id});
  Future<bool> updateUser({required UserModel user});
}
