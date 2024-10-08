import '../../../utils/logger.dart';
import '../../models/game/game.dart';
import '../../models/user.dart';

class FirebaseDatabase {
  FirebaseDatabase();

  Future<bool> addUser({required UserModel user}) async {
    return await usersRef
        .doc(user.id)
        .set(user)
        .then((value) => true)
        .catchError((error, stackTrace) {
      Logger.e(error, null, stackTrace);
      return false;
    });
  }

  Future<UserModel?> getUser({required String id}) async {
    return await usersRef.doc(id).get().then((value) async {
      if (value.data != null) {
        return value.data!;
      } else {
        Logger.d('$id 존재하지 않음');
        return null;
      }
    });
  }

  Future<bool> updateUser({required UserModel user}) async {
    final result = await usersRef
        .doc(user.id)
        .set(user.copyWith(modifiedAt: DateTime.now()))
        .then((value) => true)
        .catchError((error, stackTrace) {
      Logger.e(error, null, stackTrace);
      return false;
    });

    return result;
  }

  /// Mate
  Future<List<GameModel>> getGames() async {
    return await gamesRef
        .get()
        .then((value) => value.docs.map((e) => e.data).toList());
  }
}
