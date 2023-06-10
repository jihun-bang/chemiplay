import 'package:chemiplay/data/models/user.dart';
import 'package:chemiplay/injection.dart';
import 'package:chemiplay/presentation/viewmodels/signup_profile_viewmodel.dart';
import 'package:chemiplay/presentation/views/signup/profile/widgets/signup_profile_title.dart';
import 'package:chemiplay/presentation/widgets/gigi_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupProfileGenderContent extends StatefulWidget {
  const SignupProfileGenderContent({
    super.key,
  });

  @override
  State<SignupProfileGenderContent> createState() =>
      _SignupProfileGenderContentState();
}

class _SignupProfileGenderContentState
    extends State<SignupProfileGenderContent> {
  var _signupProfileViewModel = getIt<SignupProfileViewModel>();
  final inActiveBackgroundColor = Colors.white;
  final inActiveShadowColor = const Color(0xffe3e6eb);
  final activeBackgroundColor = const Color(0xFFFF8066);
  final activeShadowColor = const Color(0xFF4D4D4D);

  void selectGender(Gender gender) {
    _signupProfileViewModel.setGender(gender);
    _signupProfileViewModel.setNextButtonDisabled(false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupProfileViewModel>(builder: (context, viewModel, __) {
      _signupProfileViewModel = viewModel;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SignupProfileTitle(
            title: '성별:',
            subTitle: '프로필에 보여집니다.',
          ),
          const SizedBox(
            height: 48,
          ),
          GigiElevatedButton(
            text: '여성',
            onPressed: () => selectGender(Gender.female),
            backgroundColor: _signupProfileViewModel.gender == Gender.female
                ? activeBackgroundColor
                : inActiveBackgroundColor,
            shadowColor: _signupProfileViewModel.gender == Gender.female
                ? activeShadowColor
                : inActiveShadowColor,
          ),
          const SizedBox(
            height: 16,
          ),
          GigiElevatedButton(
            text: '남성',
            onPressed: () => selectGender(Gender.male),
            backgroundColor: _signupProfileViewModel.gender == Gender.male
                ? activeBackgroundColor
                : inActiveBackgroundColor,
            shadowColor: _signupProfileViewModel.gender == Gender.male
                ? activeShadowColor
                : inActiveShadowColor,
          ),
        ],
      );
    });
  }
}
