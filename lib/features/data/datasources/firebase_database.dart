import 'package:chemiplay/core/utils/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class FirebaseDatabase {
  final FirebaseFirestore _db;

  FirebaseDatabase(this._db);

  Future<bool> addUser({required UserModel user}) async {
    Logger.d(
        'addUser ${await _db.collection('users').doc(user.id).set(user.copyWith(createdAt: DateTime.now()).toJson()).then((value) => true).catchError((error, stackTrace) {
      Logger.e(error, null, stackTrace);
      return false;
    })}');
    final result = await _db
        .collection('users')
        .doc(user.id)
        .set(user.copyWith(createdAt: DateTime.now()).toJson())
        .then((value) => true)
        .catchError((error, stackTrace) {
      Logger.e(error, null, stackTrace);
      return false;
    });

    return result;
  }

  Future<UserModel?> getUser({required String id}) async {
    return await usersRef.doc(id).get().then((value) async {
      if (value.data != null) {
        return value.data!;
      } else {
        Logger.d('$id 존재하지 않음');
        FirebaseAuth.instance.signOut();
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
}
