import 'package:chemiplay/features/presentation/viewmodels/chat_room_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../injection.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _chatViewModel = getIt<ChatRoomViewModel>();

  final _messageController = TextEditingController();


  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatRoomViewModel>(
      builder: (_, chatViewModel, ___) {
        if (!chatViewModel.isLoading) {
          return Container();
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('상대방 닉네임'),
          ),
          body: Column(
            children: [
              SingleChildScrollView(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        _chatViewModel.channelEventHandlers.messages.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_chatViewModel
                            .channelEventHandlers.messages[index].message),
                      );
                    }),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 15.0),
                          hintText: 'Type your message...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: _sendMessage,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _chatViewModel.sendMessage(_messageController.text);
        _messageController.clear();
      });
    }
  }
}
