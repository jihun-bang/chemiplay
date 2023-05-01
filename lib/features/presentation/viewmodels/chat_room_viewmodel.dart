import 'dart:html';

import 'package:chemiplay/features/presentation/handler/sendbird_channel_handler.dart';
import 'package:chemiplay/features/domain/usecases/sendbird_usecase.dart';
import 'package:chemiplay/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';

class ChatRoomViewModel extends ChangeNotifier {
  final SendbirdUseCase _sendbirdUseCase;
  late ChannelEventHandlers channelEventHandlers;

  late GroupChannel channel;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ChatRoomViewModel(this._sendbirdUseCase) {
    _setIsLoading(true);
    _setSendbird();
    _setIsLoading(false);
  }

  void _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<bool> _setSendbird() async {
    final result = await _sendbirdUseCase.login('junga1234');

    const userID = 'asdf'; // todo: 상대방 sendbird user id

    channel = await _sendbirdUseCase.enterOneToOneChannel(userID);
    channelEventHandlers = ChannelEventHandlers(getIt(),
        refresh: refresh,
        channelUrl: channel.channelUrl,
        channelType: channel.channelType);
    await channelEventHandlers.loadMessages(isForce: true);

    _isLoading = true;
    notifyListeners();

    return result != null;
  }

  User? getSendbirdUser() {
    return _sendbirdUseCase.getUser();
  }

  Future<void> refresh({
    bool loadPrevious = false,
    bool isForce = false,
  }) async {
    if (loadPrevious) {
      channelEventHandlers.loadMessages();
    } else if (isForce) {
      channelEventHandlers.loadMessages(isForce: true);
    }
    notifyListeners();
  }

  Future<void> sendMessage(String message) async {
    final preMessage = await _sendbirdUseCase.sendMessage(channel, message);
    channelEventHandlers.messages.add(preMessage);
    notifyListeners();
  }
}
