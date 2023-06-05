import '../../data/models/user.dart';
import '../repositories/user_repository.dart';

/// TODO 실제 Mate로 변경해야함
class MateUseCase {
  final UserRepository _repository;

  MateUseCase(this._repository);

  Future<UserModel?> getUser({required String id}) async {
    return await _repository.getUser(id: id);
  }
}
