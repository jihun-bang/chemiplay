import 'package:cached_network_image/cached_network_image.dart';
import 'package:chemiplay/features/data/models/user_profile.dart';
import 'package:chemiplay/injection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/utils/colors.dart';
import '../dialog/toast.dart';
import '../viewmodels/user_viewmodel.dart';
import '../widgets/game_cost.dart';
import '../widgets/gigi_elevated_button.dart';

class UserProfilePage extends StatefulWidget {
  final UserProfileModel userProfile;

  const UserProfilePage({
    super.key,
    required this.userProfile,
  });

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final _userViewModel = getIt<UserViewModel>();
  late PageController _gamInfoController;

  @override
  void initState() {
    super.initState();

    _gamInfoController = PageController(viewportFraction: 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(builder: (_, viewModel, ___) {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            _buildProfileImages,
            _buildHead,
            _buildUserInfo,
            _buildReviews,
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: const EdgeInsets.all(24),
          child: GiGiElevatedButton(
            text: '무료로 대화하기',
            onPressed: () {
              if (viewModel.user != null) {
                showToast(context: context, message: '준비중입니다!');
              } else {
                context.replaceNamed('login');
              }
            },
          ),
        ),
      );
    });
  }

  Widget get _buildProfileImages {
    return SliverAppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
        pinned: true,
        floating: false,
        snap: false,
        expandedHeight: MediaQuery.of(context).size.height / 2,
        flexibleSpace: CachedNetworkImage(
          imageUrl: widget.userProfile.imageUrls.first,
          fit: BoxFit.cover,
        ));
  }

  Widget get _buildHead {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 24, top: 24, right: 24, bottom: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.userProfile.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    GiGiElevatedButton(
                      text: '팔로우',
                      textStyle: const TextStyle(fontWeight: FontWeight.w500),
                      height: 27,
                      width: 84,
                      onPressed: () {
                        if (_userViewModel.user != null) {
                          showToast(context: context, message: '준비중입니다!');
                        } else {
                          context.replaceNamed('login');
                        }
                      },
                    )
                  ],
                ),
                _buildStatus,
                _buildGameInfo,
                _buildGameInfoIndicator,
              ],
            ),
          ),
          _buildLine,
        ],
      ),
    );
  }

  Widget get _buildStatus {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 12,
          height: 12,
          margin: const EdgeInsets.only(right: 4),
          decoration: const BoxDecoration(
              color: true ? Color(0xFF55F29D) : Colors.redAccent,
              shape: BoxShape.circle),
        ),
        const SizedBox(
          height: 18,
          child: Text(
            true ? '온라인' : '오프라인',
            style: TextStyle(fontSize: 12),
          ),
        )
      ],
    );
  }

  Widget get _buildGameInfo {
    Widget infoText(String title, String subTitle) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              title,
              style: TextStyle(color: MyColors.gray_05, fontSize: 10),
              textAlign: TextAlign.left,
            ),
          ),
          Text(
            subTitle,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.left,
          ),
        ],
      );
    }

    return Container(
      height: 90,
      margin: const EdgeInsets.only(top: 23),
      child: PageView.builder(
        controller: _gamInfoController,
        itemBuilder: (_, __) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: MyColors.gray_01,
                border: Border.all(color: MyColors.gray_02)),
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.fromLTRB(15, 11, 15, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.77),
                      child: SizedBox(
                          width: 35,
                          height: 35,
                          child:
                              Image.asset('assets/images/games/img_lol.png')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '리그오브레전드',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                height: 19.09 / 16),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: infoText('계급', '실버'),
                              ),
                              infoText('포지션', '미드, 원딜, 서폿'),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GameCost(
                      cost: '1100',
                      unit: '판',
                      costStyle: const TextStyle(
                          color: Color(0xFF53DCF0),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                      unitStyle: TextStyle(
                        color: MyColors.gray_06,
                        fontSize: 15,
                      ),
                    ),
                    GiGiElevatedButton(
                      text: '같이하기',
                      textStyle: const TextStyle(fontWeight: FontWeight.w500),
                      height: 30,
                      width: 64,
                      backgroundColor: MyColors.aqua,
                      onPressed: () {
                        if (_userViewModel.user != null) {
                          showToast(context: context, message: '준비중입니다!');
                        } else {
                          context.replaceNamed('login');
                        }
                      },
                    )
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: 4,
      ),
    );
  }

  Widget get _buildGameInfoIndicator {
    return Visibility(
        visible: true,
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 8.0),
          child: SmoothPageIndicator(
            controller: _gamInfoController,
            count: 4,
            effect: ExpandingDotsEffect(
              dotWidth: 5,
              dotHeight: 5,
              spacing: 5,
              expansionFactor: 4,
              activeDotColor: MyColors.gray_04,
              dotColor: MyColors.gray_04,
            ),
            onDotClicked: (index) => _gamInfoController.animateToPage(index,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOutCubic),
          ),
        ));
  }

  Widget get _buildLine {
    return Container(
      height: 1,
      color: MyColors.gray_03,
    );
  }

  Widget get _buildUserInfo {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 24, top: 16, right: 24, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '후원자 랭킹',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          _buildLine,
        ],
      ),
    );
  }

  Widget get _buildReviews {
    return SliverToBoxAdapter(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 24, top: 16, right: 24, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '100개의 리뷰',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
