import 'package:chemiplay/data/models/game/game.dart';

abstract class MateRepository {
  Future<List<GameModel>> getGames();
}
