import 'package:chemiplay/injection.dart';
import 'package:chemiplay/presentation/views/chat_list_page.dart';
import 'package:chemiplay/presentation/views/feed/feed_page.dart';
import 'package:chemiplay/presentation/views/mate/mates_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../dialog/toast.dart';
import '../viewmodels/user_viewmodel.dart';
import 'my/my_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController _pageController;
  final _userViewModel = getIt<UserViewModel>();

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(builder: (_, viewModel, ___) {
      return SafeArea(
        child: Scaffold(
          body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              MatesPage(),
              FeedPage(),
              ChatListPage(),
              MyPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) {
              _pageController.jumpToPage(index);
              if ((index == 2 || index == 3) &&
                  !_userViewModel.isAuthenticated) {
                context.goNamed('login');
              }
            },
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), label: '홈'),
              const BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.rectangle_dock), label: '피드'),
              const BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.bubble_left_fill), label: '채팅'),
              BottomNavigationBarItem(
                  icon: viewModel.isAuthenticated
                      ? CircleAvatar(
                          radius: 12,
                          backgroundImage: NetworkImage(
                              viewModel.user!.profileImageUrl ?? ''),
                        )
                      : const Icon(CupertinoIcons.profile_circled),
                  label: '프로필'),
            ],
          ),
        ),
      );
    });
  }
}
