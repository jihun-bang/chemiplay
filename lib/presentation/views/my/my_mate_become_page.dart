import 'package:chemiplay/injection.dart';
import 'package:chemiplay/presentation/viewmodels/user_viewmodel.dart';
import 'package:chemiplay/presentation/widgets/gigi_app_bar.dart';
import 'package:chemiplay/presentation/widgets/gigi_elevated_button.dart';
import 'package:chemiplay/presentation/widgets/gigi_elevated_square_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MyMateBecomePage extends StatefulWidget {
  const MyMateBecomePage({super.key});

  @override
  State<MyMateBecomePage> createState() => _MyMateBecomePageState();
}

class _MyMateBecomePageState extends State<MyMateBecomePage> {
  final inActiveBackgroundColor = Colors.white;
  final inActiveShadowColor = const Color(0xffe3e6eb);
  final activeBackgroundColor = const Color(0xffFFF0ED);
  final Color primaryColor = const Color(0xFFFF8066);
  final activeShadowColor = const Color(0xffFF8066);
  final _userViewModel = getIt<UserViewModel>();

  final stepTextStyle = const TextStyle(
    fontSize: 16,
    color: Color(0xff2B2B2B),
  );

  final titleTextStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Color(0xff2B2B2B),
  );

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 20;
    const double spaceBetweenButton = 10;
    final double monitorWidth = MediaQuery.of(context).size.width;
    final double usableWidth =
        monitorWidth - (horizontalPadding * 2 + spaceBetweenButton);
    const double maxWidth = 300;
    const double minWidth = 150;
    double width = (usableWidth / 2) > maxWidth
        ? maxWidth
        : ((usableWidth / 2) < minWidth ? minWidth : (usableWidth / 2));
    double height = width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const GigiAppBar(
        title: '게임 메이트 되기',
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              stepButton(
                svgFileName: 'icon_phone',
                stepText: '1단계',
                titleText: '휴대폰 번호 연동',
                onPressed: () {
                  context.pushNamed('myMateVerifyPhoneNumber');
                },
                height: height,
                width: width,
                showChecked: true,
              ),
              const SizedBox(
                width: spaceBetweenButton,
              ),
              stepButton(
                svgFileName: 'icon_profile_light',
                stepText: '2단계',
                titleText: '게임 메이트 프로필',
                onPressed: () {
                  context.pushNamed('myMateProfile');
                },
                height: height,
                width: width,
                showChecked: false,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        decoration: const BoxDecoration(color: Colors.transparent),
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 40),
        child: GigiElevatedButton(
          text: '다음',
          backgroundColor: inActiveBackgroundColor,
          shadowColor: inActiveShadowColor,
          disabled: true,
        ),
      ),
    );
  }

  stepButton({
    required String svgFileName,
    required String stepText,
    required String titleText,
    bool showChecked = false,
    double height = 200,
    double? width,
    VoidCallback? onPressed,
  }) {
    return GigiElevatedSquareButton(
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/my/$svgFileName.svg',
            height: 30,
            width: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            stepText,
            style: stepTextStyle,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            titleText,
            style: titleTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Opacity(
            opacity: showChecked ? 1 : 0,
            child: SvgPicture.asset(
              'assets/icons/icon_check.svg',
              height: 18,
              width: 18,
              color: const Color(0xff69E550),
            ),
          ),
        ],
      ),
      height: height,
      width: width,
      onPressed: onPressed,
    );
  }
}
