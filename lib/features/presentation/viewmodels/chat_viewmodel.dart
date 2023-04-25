import 'package:chemiplay/core/services/sendbird_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';

class ChatViewModel extends ChangeNotifier {
  final SendbirdService _sendbirdService;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ChatViewModel(this._sendbirdService) {
    _setIsLoading(true);
    _setSendbird();
    _setIsLoading(false);
  }

  void _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> _setSendbird() async {
    await _sendbirdService.signIn('junga1234');
    await _sendbirdService.enterOpenChannel(
        'sendbird_open_channel_10182_573cc75467a0d6e16280c4d5afc5cadab95870a4');
  }

  void sendMessage(String message) {
    _sendbirdService.sendMessage(message);
  }
}
