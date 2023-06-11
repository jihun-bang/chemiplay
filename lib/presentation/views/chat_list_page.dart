import 'package:chemiplay/presentation/widgets/gigi_app_bar.dart';
import 'package:chemiplay/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';

import '../../../injection.dart';
import '../viewmodels/chat_viewmodel.dart';
import '../viewmodels/user_viewmodel.dart';

// 채팅 리스트 화면
class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  final _chatViewModel = getIt<ChatViewModel>();
  final _userViewModel = getIt<UserViewModel>();

  // final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // _textController.dispose();
    super.dispose();
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
          channel.lastMessage == null ? "" : channel.lastMessage!.message;

      return ListTile(
        // leading: CircleAvatar(
        //   backgroundImage: NetworkImage(channel.coverUrl),
        // ),
        title: Text('닉네임: ${otherMember.nickname}'),
        subtitle: Text(
          lastMessage,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 16.71 / 14,
              color: MyColors.black_02),
        ),

        onTap: () {
          context.pushNamed('chat',
              pathParameters: {'userId': otherMember!.userId});
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userEmail = _userViewModel.user?.email;
    print('userEmail : $userEmail');
    if (userEmail == null) {
      return Container();
    }

    return Consumer<ChatViewModel>(builder: (_, chatViewModel, ___) {
      if (chatViewModel.isLoggedIn == false) {
        chatViewModel.setSendbird(userEmail);
      }

      // if (chatViewModel.isLoggedIn == true && _chatViewModel.isLoading == false) {
      //   chatViewModel.loadChannelList();
      // }

      if (chatViewModel.isLoggedIn == false ||
          chatViewModel.isLoading == true) {
        return Container();
      }

      return Scaffold(
        appBar: const GigiAppBar(
          title: '메시지',
          titleAlign: Alignment.centerLeft,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('채팅방 개수 ${chatViewModel.channelList.length}'),
            // TextField(
            //   controller: _textController,
            //   decoration: const InputDecoration(
            //     contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
            //     hintText: '추가할 채팅 닉네임(추가 후 새로고침 해줘)',
            //   ),
            //   onEditingComplete: () {
            //     if (_textController.text.isNotEmpty) {
            //       setState(() {
            //         chatViewModel
            //             .enterOneToOneChannelWith(_textController.text);
            //         _textController.clear();
            //       });
            //     }
            //   },
            // ),
            Expanded(
              child: ListView.builder(
                itemCount: chatViewModel.channelList.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildChatListItem(chatViewModel.channelList[index]);
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
