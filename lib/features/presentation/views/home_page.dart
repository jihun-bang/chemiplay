import 'dart:math';

import 'package:chemiplay/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../dialog/toast.dart';
import '../viewmodels/user_viewmodel.dart';
import '../widgets/profile_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _viewModel = getIt<UserViewModel>();
  final List<String> _games = [
    '모든게임',
    '리그오브레전드',
    '전략적 팀 전투',
    '발로란트',
    '배틀그러운드',
    '서든어택',
    '배틀그라운드 모바일',
    '오버워치',
    '리그오브레전드: 와일드 리프트'
  ];
  String _selGame = '모든게임';

  void _showCupertinoPopup() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300,
          child: CupertinoPicker(
            itemExtent: 30,
            onSelectedItemChanged: (int index) {
              setState(() {
                _selGame = _games[index];
              });
            },
            children: _games.map((String value) {
              return Text(value);
            }).toList(),
          ),
        );
      },
    );
  }

  void _goChatList() {
    if (_viewModel.isAuthenticated) {
      showToast(context: context, message: '준비중입니다!');
    } else {
      context.goNamed('chats');
    }
  }

  void _goProfile() {
    if (_viewModel.isAuthenticated) {
      showToast(context: context, message: '준비중입니다!');
    } else {
      context.goNamed('login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(builder: (_, viewModel, ___) {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            _buildGames,
            _buildBanner,
            _buildTitle,
            _buildUserCards,
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) {
            if (index == 2) {
              _goChatList();
            } else if (index == 3) {
              _goProfile();
            } else {
              showToast(context: context, message: '준비중입니다!');
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
                        backgroundImage:
                            NetworkImage(viewModel.user!.profileImageUrl ?? ''),
                      )
                    : const Icon(CupertinoIcons.profile_circled),
                label: '프로필'),
          ],
        ),
      );
    });
  }

  Widget get _buildGames {
    return SliverAppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
        pinned: true,
        floating: true,
        snap: false,
        expandedHeight: 48,
        flexibleSpace: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                '👾',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: _showCupertinoPopup,
                child: Row(
                  children: [
                    Text(
                      _selGame,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.01,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 11.75),
                      child: Icon(Icons.keyboard_arrow_down_sharp,
                          color: Color(0xFF2B2B2B)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget get _buildBanner {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: AspectRatio(
              aspectRatio: 320 / 100,
              child: Image.asset(
                'assets/images/img_banner.png',
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }

  Widget get _buildTitle {
    return const SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      sliver: SliverToBoxAdapter(
        child: Text(
          '추천 케미 파트너',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            height: 25.0 / 18.0,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget get _buildUserCards {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          childAspectRatio: 170 / 250,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        delegate: SliverChildBuilderDelegate(
          (_, int index) {
            Random random = Random();
            bool randomBoolean = random.nextBool();
            bool status = random.nextBool();
            if (randomBoolean) {
              return ProfileCard(
                isOnline: status,
                name: '탑솔러 방지훈',
                rating: 4.9,
                game: '리그오브레전드',
                description: '탑의신입니다.',
                cost: 1000,
                imageUrl:
                    'https://firebasestorage.googleapis.com/v0/b/gigi-chemiplay.appspot.com/o/profile_image%2Fuser_1.jpg?alt=media&token=fa6b5113-9b03-45ca-9c0d-b0871cf98f0b',
                onTap: () {
                  context.pushNamed('user', params: {'id': '탑솔러 방지훈'});
                },
              );
            } else {
              return ProfileCard(
                isOnline: status,
                name: '새게임아이디',
                rating: 4.6,
                game: '리그오브레전드',
                description: '브론즈 소농민 대기중',
                cost: 1100,
                imageUrl:
                    'https://firebasestorage.googleapis.com/v0/b/gigi-chemiplay.appspot.com/o/profile_image%2Fuser_2.jpg?alt=media&token=2d827a1a-b61a-4902-a163-b35a9d545fe5',
                onTap: () {
                  context.pushNamed('user', params: {'id': '새게임아이디'});
                },
              );
            }
          },
          childCount: 20,
        ),
      ),
    );
  }
}
