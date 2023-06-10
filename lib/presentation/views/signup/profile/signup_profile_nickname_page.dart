import 'package:chemiplay/presentation/viewmodels/signup_profile_viewmodel.dart';
import 'package:chemiplay/presentation/views/signup/profile/widgets/signup_profile_wrapper.dart';
import 'package:chemiplay/presentation/views/signup/profile/widgets/signup_profile_nickname_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupProfileNicknamePage extends StatefulWidget {
  final PageController pageController;
  const SignupProfileNicknamePage({
    super.key,
    required this.pageController,
  });

  @override
  State<SignupProfileNicknamePage> createState() =>
      _SignupProfileNicknamePageState();
}

class _SignupProfileNicknamePageState extends State<SignupProfileNicknamePage> {
  bool disabled = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupProfileViewModel>(
      builder: (context, viewModel, _) {
        disabled = !viewModel.validateNickname(viewModel.nickname);
        return SignupProfileWrapper(
          contents: const SignupProfileNicknameContent(),
          disableNextButton: disabled,
          onNextPage: () {
            widget.pageController.nextPage(
              duration: const Duration(milliseconds: 150),
              curve: Curves.linear,
            );
          },
          pageController: widget.pageController,
        );
      },
    );
  }
}
