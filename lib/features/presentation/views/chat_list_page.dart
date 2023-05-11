import 'package:chemiplay/features/presentation/viewmodels/chat_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';

import '../../../injection.dart';

// 채팅 리스트 화면
class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  final _chatViewModel = getIt<ChatViewModel>();

  @override
  void initState() {
    super.initState();
  }

  // 채팅 리스트 아이템 위젯
  Widget _buildChatListItem(GroupChannel channel) {
    Member? otherMember;

    for (var member in channel.members) {
      if (member.userId != _chatViewModel.getSendbirdUser()!.userId) {
        otherMember = member;
        break;
      }
    }

    if (otherMember == null) {
      return const ListTile();
    } else {
      final lastMessage =
          channel.lastMessage != null ? "" : channel.lastMessage!.message;

      return ListTile(
        // leading: CircleAvatar(
        //   backgroundImage: NetworkImage(channel.coverUrl),
        // ),
        title: Text('닉네임: ${otherMember.nickname}'),
        subtitle: Text(lastMessage + otherMember.userId),
        onTap: () {
          context.pushNamed('chat', params: {'userId': otherMember!.userId});
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatViewModel>(builder: (_, chatViewModel, ___) {
      if (!chatViewModel.isLoggedIn) {
        return Container();
      }

      _chatViewModel.loadChannelList();

      return Scaffold(
        appBar: AppBar(
          title: const Text("메시지"),
        ),
        body: ListView.builder(
          itemCount: chatViewModel.channelList.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildChatListItem(chatViewModel.channelList[index]);
          },
        ),
      );
    });
  }
}
