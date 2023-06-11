import 'dart:math';

import 'package:chemiplay/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/colors.dart';
import '../../widgets/profile_card.dart';

class MatesPage extends StatefulWidget {
  const MatesPage({super.key});

  @override
  State<MatesPage> createState() => _MatesPageState();
}

class _MatesPageState extends State<MatesPage> {
  final List<String> _games = [
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
          _buildGames,
          _buildTitle,
          if (_users.isNotEmpty) _buildMateCards,
        ],
      ),
    );
  }

  Widget get _buildGames {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 15.81),
        height: 98,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _games.length,
            itemBuilder: (_, index) => InkWell(
                  onTap: () {
                    setState(() {
                      _selGame = _games[index];
                    });
                  },
                  child: SizedBox(
                    width: 85,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: MyColors.gray_06),
                          width: 60,
                          height: 60,
                        ),
                        Text(
                          _games[index],
                          style: TextStyle(
                              height: 14.31 / 12,
                              letterSpacing: -0.02,
                              color: MyColors.black_02,
                              fontSize: 12,
                              overflow: TextOverflow.ellipsis),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                )),
      ),
    );
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
