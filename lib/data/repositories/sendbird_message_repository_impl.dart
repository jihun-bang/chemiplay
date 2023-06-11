import 'package:sendbird_sdk/sendbird_sdk.dart';

import '../../domain/repositories/sendbird_message_repository.dart';

class SendbirdMessageRepositoryImpl extends SendbirdMessageRepository {
  SendbirdMessageRepositoryImpl();

  @override
  Future<BaseMessage> sendMessage(
      GroupChannel groupChannel, String message) async {
    try {
      final params = UserMessageParams(message: message)..customType = 'custom';

      return groupChannel.sendUserMessage(params,
          onCompleted: (message, err) {});
    } catch (e) {
      throw Exception([e, 'Send Message has failed']);
    }
  }
}
