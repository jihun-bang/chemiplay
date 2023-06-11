import 'package:cached_network_image/cached_network_image.dart';
import 'package:chemiplay/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../viewmodels/user_viewmodel.dart';

class HomePage extends StatefulWidget {
  final StatefulNavigationShell child;

  const HomePage({
    super.key,
    required this.child,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _userViewModel = getIt<UserViewModel>();

  int _page = 0;

  void _toPage(int index) {
    if ((index == 2 || index == 3) && !_userViewModel.isAuthenticated) {
      context.goNamed('login');
    } else {
      final route = switch (index) {
        0 => 'mates',
        1 => 'feed',
        2 => 'chats',
        3 => 'my',
        (_) => '',
      };
      context.goNamed(route);
    }
  }

  String _getOnOff(int index) {
    if (index == _page) {
      return 'on';
    }
    return 'off';
  }

  @override
  void initState() {
    super.initState();

    _page = widget.child.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(builder: (_, viewModel, ___) {
      return SafeArea(
        child: Scaffold(
          body: widget.child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _page,
            onTap: (int index) {
              setState(() {
                _page = index;
              });
              _toPage(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/bottom_navigation/icon_logo_${_getOnOff(0)}.svg',
                    width: 24,
                  ),
                  label: '홈'),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/bottom_navigation/icon_feed_${_getOnOff(1)}.svg',
                  width: 20,
                ),
                label: '피드',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/bottom_navigation/icon_chat_${_getOnOff(2)}.svg',
                  width: 24,
                ),
                label: '메시지',
              ),
              BottomNavigationBarItem(
                  icon: viewModel.isAuthenticated
                      ? CircleAvatar(
                          radius: 14.2,
                          backgroundColor:
                              _page == 3 ? Colors.black : Colors.transparent,
                          child: CircleAvatar(
                            radius: 13,
                            backgroundColor: Colors.black,
                            backgroundImage: CachedNetworkImageProvider(
                                viewModel.user!.profileImageUrl ?? ''),
                          ),
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
