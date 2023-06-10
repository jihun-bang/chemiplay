import 'package:chemiplay/presentation/viewmodels/signup_profile_viewmodel.dart';
import 'package:chemiplay/presentation/views/signup/profile/widgets/signup_profile_wrapper.dart';
import 'package:chemiplay/presentation/views/signup/profile/widgets/signup_profile_gender_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupProfileGenderPage extends StatefulWidget {
  final PageController pageController;
  const SignupProfileGenderPage({super.key, required this.pageController});

  @override
  State<SignupProfileGenderPage> createState() =>
      _SignupProfileGenderPageState();
}

class _SignupProfileGenderPageState extends State<SignupProfileGenderPage> {
  bool disabled = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupProfileViewModel>(builder: (context, viewModel, _) {
      if (viewModel.gender != null) {
        disabled = false;
      }
      return SignupProfileWrapper(
        contents: const SignupProfileGenderContent(),
        disableNextButton: disabled,
        onNextPage: () {
          widget.pageController.nextPage(
            duration: const Duration(milliseconds: 150),
            curve: Curves.linear,
          );
        },
        pageController: widget.pageController,
      );
    });
  }
}
