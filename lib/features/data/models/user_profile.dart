import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfileModel {
  final bool isOnline;
  final String name;
  final double rating;
  final String game;
  final String description;
  final int cost;
  final List<String> imageUrls;

  const UserProfileModel({
    required this.isOnline,
    required this.name,
    required this.rating,
    required this.game,
    required this.description,
    required this.cost,
    this.imageUrls = const [],
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserGameProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserGameProfileModelToJson(this);
}
