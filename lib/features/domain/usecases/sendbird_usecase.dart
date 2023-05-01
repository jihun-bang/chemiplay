import 'package:chemiplay/core/utils/logger.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';
import 'package:chemiplay/features/domain/repositories/sendbird_auth_repository.dart';

import '../repositories/sendbird_message_repository.dart';

class SendbirdUseCase {
  final SendbirdAuthRepository _authRepository;
  final SendbirdMessageRepository _messageRepository;

  SendbirdUseCase(this._authRepository, this._messageRepository);

  Future<User?> login(String userID) async {
    try {
      return await _authRepository.signIn(userId: userID);
    } catch (e) {
      Logger.error(e);
      return null;
    }
  }

  Future<void> logout() async {
    try {
      _authRepository.signOut();
    } catch (e) {
      Logger.error(e);
    }
  }

  Future<GroupChannel> enterOneToOneChannel(String userID) async {
    final List<String> userIDs = [userID, _authRepository.currentUser!.userId];
    final params = GroupChannelParams()
      ..userIds = userIDs
      ..isDistinct = true;

    return await GroupChannel.createChannel(params);
  }

  Future<BaseMessage> sendMessage(GroupChannel channel, String message) async {
    return _messageRepository.sendMessage(channel, message);
  }
}
