import 'package:json_annotation/json_annotation.dart';

part 'mate.g.dart';

@JsonSerializable()
class MateModel {
  final bool isOnline;
  final String name;
  final double rating;
  final String game;
  final String description;
  final int cost;
  final List<String> imageUrls;

  const MateModel({
    required this.isOnline,
    required this.name,
    required this.rating,
    required this.game,
    required this.description,
    required this.cost,
    this.imageUrls = const [],
  });

  factory MateModel.fromJson(Map<String, dynamic> json) =>
      _$MateModelFromJson(json);

  Map<String, dynamic> toJson() => _$MateModelToJson(this);
}
