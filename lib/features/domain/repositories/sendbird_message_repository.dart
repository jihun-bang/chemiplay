import 'package:sendbird_sdk/sendbird_sdk.dart';

abstract class SendbirdMessageRepository {
  Future<BaseMessage> sendMessage(GroupChannel groupChannel, String message);
}
