// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'mate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MateModel _$MateModelFromJson(Map<String, dynamic> json) => MateModel(
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

const _$MateModelFieldMap = <String, String>{
  'isOnline': 'isOnline',
  'name': 'name',
  'rating': 'rating',
  'game': 'game',
  'description': 'description',
  'cost': 'cost',
  'imageUrls': 'imageUrls',
};

Map<String, dynamic> _$MateModelToJson(MateModel instance) => <String, dynamic>{
      'isOnline': instance.isOnline,
      'name': instance.name,
      'rating': instance.rating,
      'game': instance.game,
      'description': instance.description,
      'cost': instance.cost,
      'imageUrls': instance.imageUrls,
    };
