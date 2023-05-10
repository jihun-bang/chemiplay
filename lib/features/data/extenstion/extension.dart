import 'package:chemiplay/features/data/models/user.dart' as u;
import 'package:firebase_auth/firebase_auth.dart';

extension UserMapper on User {
  u.UserModel toUserModel() {
    return u.UserModel(
        id: uid,
        email: email ?? '',
        name: displayName ?? uid,
        phoneNumber: phoneNumber,
        profileImageUrl: photoURL,
        createdAt: DateTime.now(),
        modifiedAt: DateTime.now());
  }
}
