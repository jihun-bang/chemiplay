import 'package:sendbird_sdk/sendbird_sdk.dart';

class SendbirdService {
  var sendbirdSdk;
  late User user;
  late OpenChannel openChannel;

  SendbirdService(String appID) {
    sendbirdSdk = SendbirdSdk(appId: appID);
  }

  Future<void> signIn(String userID) async {
    user = await sendbirdSdk.connect(userID);
  }

  Future<void> enterOpenChannel(String channelUrl) async {
    try {
      openChannel = await OpenChannel.getChannel(channelUrl);
      // Call the instance method of the result object in the openChannel parameter of the callback method.
      await openChannel.enter();
      // The current user successfully enters the open channel as a participant,
      // and can chat with other users in the channel using APIs.
    } catch (e) {
      // Handle error.
    }
  }

  void sendMessage(String message) {
    try {
      final params = UserMessageParams(message: message);
      // ..data = DATA
      // ..customType = CUSTOM_TYPE;

      final preMessage =
          openChannel.sendUserMessage(params, onCompleted: (msg, error) {
        // The message is successfully sent to the channel.
        // The current user can receive messages from other users
        // through the onMessageReceived() method in event handlers.
      });
    } catch (e) {
      print(e);
    }
  }

  void receiveMessage() {}
}
