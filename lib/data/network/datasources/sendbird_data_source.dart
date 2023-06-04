import 'package:sendbird_sdk/sendbird_sdk.dart';

class SendbirdDataSource {
  final SendbirdSdk _sendbirdSdk;

  SendbirdSdk get sendbirdSdk => _sendbirdSdk;

  SendbirdDataSource(this._sendbirdSdk);
}
