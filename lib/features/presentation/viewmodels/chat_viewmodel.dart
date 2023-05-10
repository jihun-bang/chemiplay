import 'package:chemiplay/features/presentation/handler/sendbird_channel_handler.dart';
import 'package:chemiplay/features/domain/usecases/sendbird_usecase.dart';
import 'package:chemiplay/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';

class ChatViewModel extends ChangeNotifier {
  final SendbirdUseCase _sendbirdUseCase;
  late ChannelEventHandlers channelEventHandlers;

  late GroupChannel channel;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  List<GroupChannel> channelList = [];

  ChatViewModel(this._sendbirdUseCase) {
    _setIsLoading(true);
    _setSendbird();
    _setIsLoading(false);

    notifyListeners();
  }

  void _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<bool> _setSendbird() async {
    final result = await _sendbirdUseCase.login('junga');

    _isLoggedIn = true;
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

  Future<bool> getMessage(String userID) async {
    channel = await _sendbirdUseCase.enterOneToOneChannel(userID);
    channelEventHandlers = ChannelEventHandlers(getIt(),
        refresh: refresh,
        channelUrl: channel.channelUrl,
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
    final query = GroupChannelListQuery()
      ..includeEmptyChannel = false
      ..memberStateFilter = MemberStateFilter.all
      ..order = GroupChannelListOrder.latestLastMessage
      ..limit = 20;

    channelList = await query.loadNext();

    notifyListeners();
  }
}
