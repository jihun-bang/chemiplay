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
        channelUrl: channel.channelUrl, channelType: channel.channelType);
    await channelEventHandlers.loadMessages(isForce: true);

    _isLoading = true;
    notifyListeners();

    return result != null;
  }

  Future<void> refresh({
    bool loadPrevious = false,
    bool isForce = false,
  }) async {
    //TODO check
    // switch (_channelType) {
    //   case ChannelType.group:
    //     _channel ??= await GroupChannel.getChannel(_channelUrl!);
    //     break;
    //   case ChannelType.open:
    //     _channel ??= await OpenChannel.getChannel(_channelUrl!);
    //     break;
    // }
    //
    // if (mounted) {
    //   if (loadPrevious) {
    //     _channelHandler.loadMessages();
    //   } else if (isForce) {
    //     _channelHandler.loadMessages(isForce: true);
    //   }
    // }
    // setState(() {});
  }

  void sendMessage(String message) {
    // _service.sendMessage(message);
  }
}
