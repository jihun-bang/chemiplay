import 'package:chemiplay/features/data/datasources/sendbird_data_source.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';
import 'package:chemiplay/features/domain/repositories/sendbird_auth_repository.dart';

class SendbirdAuthRepositoryImpl implements SendbirdAuthRepository {
  final SendbirdDataSource _dataSource;

  SendbirdAuthRepositoryImpl(this._dataSource);

  @override
  Future<void> dispose() async {
    signOut();
    // super.dispose();
  }

  @override
  User? get currentUser => _dataSource.sendbirdSdk.currentUser;

  @override
  bool get isSigned => _dataSource.sendbirdSdk.currentUser != null;

  @override
  Future<User> signIn({
    required String userId,
    String? nickName,
    String? accessToken,
    String? apiHost,
    String? wsHost,
  }) async {
    try {
      final user = await _dataSource.sendbirdSdk.connect(
        userId,
        nickname: nickName,
        accessToken: accessToken,
        apiHost: apiHost,
        wsHost: wsHost,
      );

      // notification 관련 부분
      // final token = appState.token; x
      //
      // // [Push Notification Set Up]
      // // register push notification token for sendbird notification
      // if (token != null) {
      //   print('registering push token through sendbird server...');
      //   var result = await _sendbird.registerPushToken(
      //     type: kIsWeb
      //         ? PushTokenType.none
      //         : Platform.isIOS
      //         ? PushTokenType.apns
      //         : PushTokenType.fcm,
      //     token: token,
      //   );
      //   // Result for register Push Token
      //   // [success, pending, error]
      //   print(result);
      // }

      return user;
    } catch (e) {
      throw Exception([e, 'Connecting with Sendbird Server has failed']);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _dataSource.sendbirdSdk.disconnect();
    } catch (e) {
      throw Exception([e, 'Disconnecting with Sendbird Server has failed']);
    }
  }

  @override
  SendbirdSdk get sendbirdSdk => _dataSource.sendbirdSdk;

  @override
  Future<void> updateCurrentInfo({
    String? nickName,
    FileInfo? file,
    List<String>? preferredLanguage,
  }) async {
    try {
      await _dataSource.sendbirdSdk.updateCurrentUserInfo(
        nickname: nickName,
        fileInfo: file,
        preferredLanguages: preferredLanguage,
      );
    } catch (e) {
      throw Exception([e, 'Failed to update current user info.']);
    }
  }
}
