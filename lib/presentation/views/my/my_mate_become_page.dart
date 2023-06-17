import 'package:chemiplay/injection.dart';
import 'package:chemiplay/presentation/viewmodels/user_viewmodel.dart';
import 'package:chemiplay/presentation/widgets/gigi_app_bar.dart';
import 'package:chemiplay/presentation/widgets/gigi_elevated_button.dart';
import 'package:chemiplay/presentation/widgets/gigi_elevated_square_button.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const GigiAppBar(
        title: '게임 메이트 되기',
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              stepButton(
                icon: const Icon(Icons.ac_unit_outlined),
                stepText: '1단계',
                titleText: '휴대폰 번호 연동',
                onPressed: () {
                  context.pushNamed('myMateVerifyPhoneNumber');
                },
              ),
              const SizedBox(
                width: 10,
              ),
              stepButton(
                icon: const Icon(Icons.ac_unit_outlined),
                stepText: '2단계',
                titleText: '게임 메이트 프로필',
                onPressed: () {
                  context.pushNamed('myMateProfile');
                },
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
    required Icon icon,
    required String stepText,
    required String titleText,
    VoidCallback? onPressed,
  }) {
    return Expanded(
      child: GigiElevatedSquareButton(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
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
          ],
        ),
        height: 200,
        onPressed: onPressed,
      ),
    );
  }
}
