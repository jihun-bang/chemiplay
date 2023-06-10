import 'package:chemiplay/presentation/viewmodels/signup_profile_viewmodel.dart';
import 'package:chemiplay/presentation/views/signup/profile/widgets/signup_profile_wrapper.dart';
import 'package:chemiplay/presentation/views/signup/profile/signup_profile_image_page.dart';
import 'package:chemiplay/presentation/views/signup/profile/widgets/signup_profile_nickname_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupProfileNicknamePage extends StatefulWidget {
  const SignupProfileNicknamePage({super.key});

  @override
  State<SignupProfileNicknamePage> createState() =>
      _SignupProfileNicknamePageState();
}

class _SignupProfileNicknamePageState extends State<SignupProfileNicknamePage> {
  bool disabled = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupProfileViewModel>(builder: (context, viewModel, _) {
      disabled = !viewModel.validateNickname(viewModel.nickname);
      return SignupProfileWrapper(
        contents: const SignupProfileNicknameContent(),
        disableNextButton: disabled,
        onNextPage: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const SignupProfileImagePage();
              },
            ),
          );
        },
      );
    });
  }
}
