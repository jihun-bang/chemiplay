import 'package:sendbird_sdk/sendbird_sdk.dart';

abstract class SendbirdAuthRepository {
  Future<User> signIn({
    required String userId,
    String? nickName,
    String? accessToken,
    String? apiHost,
    String? wsHost,
  });

  Future<void> signOut();

  User? get currentUser;

  bool get isSigned;

  Future<void> dispose();

  SendbirdSdk get sendbirdSdk;

  Future<void> updateCurrentInfo({
    String? nickName,
    FileInfo? file,
    List<String>? preferredLanguage,
  });
}
