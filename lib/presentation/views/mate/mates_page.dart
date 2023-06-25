import 'dart:math';

import 'package:chemiplay/data/models/user.dart';
import 'package:chemiplay/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/profile_card.dart';

class MatesPage extends StatefulWidget {
  const MatesPage({super.key});

  @override
  State<MatesPage> createState() => _MatesPageState();
}

class _MatesPageState extends State<MatesPage> {
  final List<String> _games = [
    'lol',
    'valorant',
    'suddenattack',
    'overwatch',
    'pubg',
    'mpubg',
    'tft',
    'wildrift',
  ];

  List<UserModel> _users = [];

  @override
  void initState() {
    super.initState();

    /// TODO 임시 Mate
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final users = await usersRef
          .get()
          .then((value) => value.docs.map((e) => e.data).toList());
      if (mounted) {
        setState(() {
          _users = users;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildBanner,
          _buildTitle('추천 게임'),
          _buildGames,
          _buildTitle('추천 메이트'),
          if (_users.isNotEmpty) _buildMateCards,
        ],
      ),
    );
  }

  Widget get _buildGames {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
        height: 60,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          scrollDirection: Axis.horizontal,
          itemCount: _games.length,
          itemBuilder: (_, index) => MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {},
              child: SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.asset(
                      'assets/icons/games/icon_${_games[index]}.png')),
            ),
          ),
          separatorBuilder: (_, __) => const SizedBox(
            width: 8,
          ),
        ),
      ),
    );
  }

  Widget get _buildBanner {
    return SliverToBoxAdapter(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 7.81),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: AspectRatio(
              aspectRatio: 320 / 100, child: Container(color: Colors.grey)),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      sliver: SliverToBoxAdapter(
        child: Text(
          title,
          style: MyTextStyle.h3Semi(),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget get _buildMateCards {
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
              int nextIndex = random.nextInt(6);
              return ProfileCard(
                isOnline: status,
                name: _users[nextIndex].name,
                rating: 4.9,
                game: '리그오브레전드',
                description: '탑의신입니다.',
                cost: 1000,
                imageUrl:
                    'https://firebasestorage.googleapis.com/v0/b/gigi-chemiplay.appspot.com/o/profile_image%2Fuser_1.jpg?alt=media&token=fa6b5113-9b03-45ca-9c0d-b0871cf98f0b',
                onTap: () {
                  context.pushNamed('mate',
                      pathParameters: {'id': _users[nextIndex].id});
                },
              );
            } else {
              int nextIndex = random.nextInt(6);
              return ProfileCard(
                isOnline: status,
                name: _users[nextIndex].name,
                rating: 4.6,
                game: '리그오브레전드',
                description: '브론즈 소농민 대기중',
                cost: 1100,
                imageUrl:
                    'https://firebasestorage.googleapis.com/v0/b/gigi-chemiplay.appspot.com/o/profile_image%2Fuser_2.jpg?alt=media&token=2d827a1a-b61a-4902-a163-b35a9d545fe5',
                onTap: () {
                  context.pushNamed('mate',
                      pathParameters: {'id': _users[nextIndex].id});
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
