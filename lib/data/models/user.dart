import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class UserModel {
  /// 고유 ID
  @Id()
  final String id;

  /// 이메일
  final String email;

  /// 이름
  final String name;

  /// 프로필 이미지
  final String? profileImageUrl;

  /// 전화번호
  final String? phoneNumber;

  /// 성별
  final Gender? gender;

  /// 생년월일
  final String? birthday;

  /// 자기소개
  final String? introduction;

  /// 사용자 상태
  final UserStatus status;

  /// 가입 날짜
  final DateTime createdAt;

  /// 업데이트 날짜
  final DateTime modifiedAt;

  /// 탈퇴 날짜
  final DateTime? deletedAt;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.profileImageUrl,
    this.phoneNumber,
    this.gender,
    this.birthday,
    this.introduction,
    this.status = UserStatus.normal,
    required this.createdAt,
    required this.modifiedAt,
    this.deletedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class FollowingModel {
  /// 고유 ID
  @Id()
  final String id;

  /// 이메일
  final String email;

  FollowingModel({
    required this.id,
    required this.email,
  });

  factory FollowingModel.fromJson(Map<String, dynamic> json) =>
      _$FollowingModelFromJson(json);

  Map<String, dynamic> toJson() => _$FollowingModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class FollowerModel extends FollowingModel {
  FollowerModel({required super.id, required super.email});
}

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum UserStatus {
  normal,
  pause,
  withdraw,
}

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum Gender {
  male('남자'),
  female('여자');

  const Gender(this.kr);
  final String kr;
}

@Collection<UserModel>('users')
@Collection<FollowingModel>('users/*/following', name: 'following')
@Collection<FollowerModel>('users/*/followers', name: 'followers')
final usersRef = UserModelCollectionReference();
