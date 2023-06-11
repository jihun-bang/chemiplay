import 'package:chemiplay/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';

import '../../domain/usecases/sendbird_usecase.dart';
import '../handler/sendbird_channel_handler.dart';

class ChatViewModel extends ChangeNotifier {
  final SendbirdUseCase _sendbirdUseCase;
  late ChannelEventHandlers channelEventHandlers;

  late User? sendbirdUser;
  late GroupChannel channel;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<GroupChannel> channelList = [];

  ChatViewModel(this._sendbirdUseCase) {
    // _setIsLoading(true);
    // setSendbird();
    // _setIsLoading(false);

    // notifyListeners();
  }

  Future<void> setSendbird(String userEmail, nickName) async {
    if (_isLoggedIn == true) {
      return;
    }

    sendbirdUser = await _sendbirdUseCase.login(userEmail, nickName);

    loadChannelList();

    _isLoggedIn = true;

    notifyListeners();
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

  Future<void> enterOneToOneChannelWith(String userID) async {
    channel = await _sendbirdUseCase.enterOneToOneChannel(userID);

    notifyListeners();
  }

  Future<bool> getMessageWith(String userID) async {
    channel = await _sendbirdUseCase.enterOneToOneChannel(userID);

    channelEventHandlers = ChannelEventHandlers(getIt(),
        refresh: refresh,
        channelUrl: channel.channelUrl,
        channelType: channel.channelType);

    await channelEventHandlers.getChannel(channel.channelUrl,
        channelType: channel.channelType);
    await channelEventHandlers.loadMessages(isForce: true);

    notifyListeners();

    return true;
  }

  Future<void> sendMessage(String message) async {
    final preMessage = await _sendbirdUseCase.sendMessage(channel, message);
    channelEventHandlers.messages.add(preMessage);

    notifyListeners();
  }

  Future<void> loadChannelList() async {
    if (_isLoading == true) {
      return;
    }
    _isLoading = true;

    final query = GroupChannelListQuery()
      ..includeEmptyChannel = true
      ..memberStateFilter = MemberStateFilter.all
      ..order = GroupChannelListOrder.latestLastMessage
      ..limit = 20;

    channelList = await query.loadNext();

    _isLoading = false;
    notifyListeners();
  }
}
