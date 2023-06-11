import 'package:chemiplay/presentation/widgets/gigi_app_bar.dart';
import 'package:chemiplay/utils/colors.dart';
import 'package:chemiplay/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
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
    Member? mate;

    for (var member in channel.members) {
      if (member.userId != _chatViewModel.getSendbirdUser()!.userId) {
        mate = member;
        break;
      }
    }

    if (mate == null) {
      return const ListTile();
    }

    final lastMessage = channel.lastMessage?.message ?? "";
    final lastMessageTime = channel.lastMessage?.createdAt != null
        ? getLastMessageTime(channel.lastMessage!.createdAt)
        : "";

      var profileUrl = "";

      return Slidable(
        key: const Key('modification'),
        startActionPane: ActionPane(
          motion: const BehindMotion(),
          extentRatio: 70 / 390,
          children: <Widget> [
            SlidableAction(
              backgroundColor: MyColors.vio_06,
              foregroundColor: Colors.white,
              label: '고정',
              onPressed: (BuildContext context) {
                print('고정');
              },
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const BehindMotion(),
          extentRatio: 70 / 390,
          children: <Widget> [
            SlidableAction(
              backgroundColor: MyColors.pri_06,
              foregroundColor: Colors.white,
              label: '삭제',
              onPressed: (BuildContext context) {
                print('삭제');
              },
            ),
          ],
        ),
        child: ListTile(
          leading: const CircleAvatar(
            backgroundImage: null,
          ),
          title: Text(mate.nickname, style: MyTextStyle.body1Med()),
          subtitle: Text(lastMessage, style: MyTextStyle.body2Reg()),
          trailing: SizedBox(
            height: double.infinity,
            child: Text(
              lastMessageTime,
              style: MyTextStyle.body2Semi(color: MyColors.gray_06),
            ),
          ),
          onTap: () {
            context.pushNamed('chat', pathParameters: {'userId': mate!.userId});
          },
        ),
      );
  }

  String getLastMessageTime(int createdAt) {
    DateTime now = DateTime.now();
    DateTime createdAtTime = DateTime.fromMillisecondsSinceEpoch(createdAt);

    Duration difference = now.difference(createdAtTime);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}분 전';
    }

    if (difference.inDays < 1) {
      return DateFormat('a h시 mm분').format(createdAtTime);
    }

    return DateFormat('MM월 dd일').format(createdAtTime);
  }

  @override
  Widget build(BuildContext context) {
    final userEmail = _userViewModel.user?.email;
    final name = _userViewModel.user?.name;

    if (userEmail == null) {
      return Container();
    }

    return Consumer<ChatViewModel>(builder: (_, chatViewModel, ___) {
      if (chatViewModel.isLoggedIn == false) {
        chatViewModel.setSendbird(userEmail, name);
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
