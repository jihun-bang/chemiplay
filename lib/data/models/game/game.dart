import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game.g.dart';

@JsonSerializable()
class GameModel {
  final String name;
  final String image;
  final List<String> position;
  final List<String> rank;

  GameModel({
    required this.name,
    required this.image,
    required this.position,
    required this.rank,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) =>
      _$GameModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameModelToJson(this);
}

@Collection<GameModel>('games')
final gamesRef = GameModelCollectionReference();
