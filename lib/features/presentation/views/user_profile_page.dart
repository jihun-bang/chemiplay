import 'package:cached_network_image/cached_network_image.dart';
import 'package:chemiplay/features/data/models/user_profile.dart';
import 'package:chemiplay/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/colors.dart';
import '../dialog/toast.dart';
import '../viewmodels/user_viewmodel.dart';
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

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(builder: (_, viewModel, ___) {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            _buildGames,
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

  Widget get _buildGames {
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
                        letterSpacing: -0.02,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    GiGiElevatedButton(
                      text: '팔로우',
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.01,
                          fontSize: 14),
                      height: 30,
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
                _buildGamInfo,
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
            style: TextStyle(letterSpacing: -0.02, fontSize: 12),
          ),
        )
      ],
    );
  }

  Widget get _buildGamInfo {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFF4F6F9),
      ),
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
                    child: Image.asset('assets/images/games/img_lol.png')),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  '리그오브레전드',
                  style: TextStyle(),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: SvgPicture.asset(
                  'assets/icons/icon_coin.svg',
                  width: 24,
                  height: 24,
                ),
              ),
              RichText(
                  text: TextSpan(
                      text: '1100',
                      style: const TextStyle(
                          color: Color(0xFF53DCF0),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.02),
                      children: [
                    TextSpan(
                        text: '/판',
                        style: TextStyle(
                          letterSpacing: -0.02,
                          color: MyColors.gray_06,
                          fontSize: 15,
                        ))
                  ]))
            ],
          ),
        ],
      ),
    );
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
                  '파트너 정보',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.02,
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
                letterSpacing: -0.02,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
