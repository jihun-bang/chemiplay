import 'package:chemiplay/data/models/game/game.dart';
import 'package:chemiplay/domain/repositories/mate_repository.dart';

import '../../utils/logger.dart';
import '../network/datasources/firebase_database.dart';

class MateRepositoryImpl implements MateRepository {
  final FirebaseDatabase _firebaseDatabase;

  MateRepositoryImpl(this._firebaseDatabase);

  @override
  Future<List<GameModel>> getGames() async {
    try {
      return await _firebaseDatabase.getGames();
    } catch (e) {
      Logger.e(e);
      return [];
    }
  }
}
