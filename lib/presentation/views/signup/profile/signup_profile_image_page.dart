import 'package:chemiplay/injection.dart';
import 'package:chemiplay/presentation/viewmodels/signup_profile_viewmodel.dart';
import 'package:chemiplay/presentation/views/signup/profile/widgets/signup_profile_wrapper.dart';
import 'package:chemiplay/presentation/views/signup/profile/widgets/signup_profile_image_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupProfileImagePage extends StatefulWidget {
  final PageController pageController;
  const SignupProfileImagePage({
    super.key,
    required this.pageController,
  });

  @override
  State<SignupProfileImagePage> createState() => _SignupProfileImagePageState();
}

class _SignupProfileImagePageState extends State<SignupProfileImagePage> {
  bool disabled = true;
  final _signupProfileViewModel = getIt<SignupProfileViewModel>();

  Future<void> onNextTap() async {
    // validate image exist
    // upload image
    await _signupProfileViewModel.uploadProfileImage();
    // update user
    await _signupProfileViewModel.updateUserProfile();
    // go home
    // context.goNamed('home');
  }

  Future<void> onSkipTap() async {
    // update user
    await _signupProfileViewModel.updateUserProfile();
    // go home
    // context.goNamed('home');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupProfileViewModel>(builder: (context, viewModel, _) {
      if (viewModel.profileImage != null) {
        disabled = false;
      }
      return SignupProfileWrapper(
        contents: SignupProfileImageContent(
          onSkipTap: onSkipTap,
        ),
        disableNextButton: disabled,
        onNextPage: onNextTap,
        pageController: widget.pageController,
      );
    });
  }
}
