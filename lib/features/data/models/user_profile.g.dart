// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileModel _$UserGameProfileModelFromJson(Map<String, dynamic> json) =>
    UserProfileModel(
      isOnline: json['isOnline'] as bool,
      name: json['name'] as String,
      rating: (json['rating'] as num).toDouble(),
      game: json['game'] as String,
      description: json['description'] as String,
      cost: json['cost'] as int,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UserGameProfileModelToJson(UserProfileModel instance) =>
    <String, dynamic>{
      'isOnline': instance.isOnline,
      'name': instance.name,
      'rating': instance.rating,
      'game': instance.game,
      'description': instance.description,
      'cost': instance.cost,
      'imageUrls': instance.imageUrls,
    };
