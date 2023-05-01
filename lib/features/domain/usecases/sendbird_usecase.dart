import 'package:chemiplay/core/utils/logger.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';
import 'package:chemiplay/features/domain/repositories/sendbird_auth_repository.dart';

class SendbirdUseCase {
  final SendbirdAuthRepository _repository;

  SendbirdUseCase(this._repository);

  Future<User?> login(String userID) async {
    try {
      return await _repository.signIn(userId: userID);
    } catch (e) {
      Logger.error(e);
      return null;
    }
  }

  Future<void> logout() async {
    try {
      _repository.signOut();
    } catch (e) {
      Logger.error(e);
    }
  }

  Future<GroupChannel> enterOneToOneChannel(String userID) async {
    final List<String> userIDs = [userID, _repository.currentUser!.userId];
    final params = GroupChannelParams()
      ..userIds = userIDs
      ..isDistinct = true;

    return await GroupChannel.createChannel(params);
  }


}
