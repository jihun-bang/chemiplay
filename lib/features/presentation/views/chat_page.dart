import 'package:chemiplay/features/presentation/viewmodels/chat_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sendbird_sdk/core/message/base_message.dart';
import '../../../injection.dart';

class ChatPage extends StatefulWidget {
  final String userId;

  const ChatPage({
    super.key,
    required this.userId,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _chatViewModel = getIt<ChatViewModel>();

  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatViewModel>(
      builder: (_, chatViewModel, ___) {
        if (!chatViewModel.isLoggedIn) {
          return Container();
        }

        chatViewModel.getMessage(widget.userId);
        return Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('채팅 상대방 닉네임')),
          ),
          body: Column(
            children: [
              _chats,
              _bottomInput,
            ],
          ),
        );
      },
    );
  }

  Widget get _chats => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            reverse: true,
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 17),
              shrinkWrap: true,
              itemCount: _chatViewModel.channelEventHandlers.messages.length,
              itemBuilder: (context, index) {
                final message =
                    _chatViewModel.channelEventHandlers.messages[index];
                final isMine = _isMyChat(message);

                final alignment =
                    isMine ? MainAxisAlignment.start : MainAxisAlignment.end;
                final chatBackground =
                    isMine ? Colors.white : const Color(0xffFFE7E1);

                return Row(mainAxisAlignment: alignment, children: <Widget>[
                  Container(
                    constraints: const BoxConstraints(maxWidth: 246),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade200),
                      color: chatBackground,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      message.message,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ]);
              },
            ),
          ),
        ),
      );

  bool _isMyChat(BaseMessage message) {
    return message.sender?.userId == _chatViewModel.getSendbirdUser()?.userId;
  }

  Widget get _bottomInput => Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                  hintText: '채팅을 입력해주세요.',
                  border: InputBorder.none,
                ),
                onEditingComplete: () {
                  _sendMessage();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 3.5),
              child: SvgPicture.asset(
                'assets/icons/icon_emoji.svg',
                width: 28,
                height: 28,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 3.5),
              child: SvgPicture.asset(
                'assets/icons/icon_call.svg',
                width: 28,
                height: 28,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 3.5),
              child: SvgPicture.asset(
                'assets/icons/icon_donation.svg',
                width: 28,
                height: 28,
              ),
            ),
          ],
        ),
      );

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _chatViewModel.sendMessage(_messageController.text);
        _messageController.clear();
      });
    }
  }
}
