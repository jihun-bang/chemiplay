import 'package:chemiplay/data/extenstion/extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image/image.dart';

import '../../data/models/user.dart';
import '../repositories/user_repository.dart';

class UserUseCase {
  final UserRepository _repository;

  UserUseCase(this._repository);

  Future<bool> addUser(User user) async {
    return await _repository.addUser(user: user.toUserModel());
  }

  Future<UserModel?> getUser({required String id}) async {
    return await _repository.getUser(id: id);
  }

  Future<bool> updateUser({required UserModel user}) async {
    return await _repository.updateUser(user: user);
  }

  Future<String> uploadImage(
      {required String userId, required Uint8List imageFile}) async {
    final image = decodeImage(imageFile)!;
    final newHeight = (image.height * (640 / image.width)).round();
    final resizedImage = copyResize(image, width: 640, height: newHeight);
    final resizedImageData = encodeJpg(resizedImage);

    final Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('user/$userId/${DateTime.now()}.jpg');
    final SettableMetadata metadata =
        SettableMetadata(contentType: 'image/jpeg');
    final UploadTask uploadTask =
        storageReference.putData(resizedImageData, metadata);
    await uploadTask;
    final String downloadUrl = await storageReference.getDownloadURL();
    return downloadUrl;
  }
}
