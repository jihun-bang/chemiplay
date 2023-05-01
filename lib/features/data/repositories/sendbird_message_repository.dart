import 'package:chemiplay/features/data/datasources/sendbird_data_source.dart';
import 'package:chemiplay/features/domain/repositories/sendbird_message_repository.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';

class SendbirdMessageRepositoryImpl extends SendbirdMessageRepository {
  final SendbirdDataSource _dataSource;

  SendbirdMessageRepositoryImpl(this._dataSource);

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
