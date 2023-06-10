import 'package:chemiplay/presentation/viewmodels/signup_profile_viewmodel.dart';
import 'package:chemiplay/presentation/views/signup/profile/widgets/signup_profile_wrapper.dart';
import 'package:chemiplay/presentation/views/signup/profile/widgets/signup_profile_image_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupProfileImagePage extends StatefulWidget {
  const SignupProfileImagePage({super.key});

  @override
  State<SignupProfileImagePage> createState() => _SignupProfileImagePageState();
}

class _SignupProfileImagePageState extends State<SignupProfileImagePage> {
  bool disabled = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupProfileViewModel>(builder: (context, viewModel, _) {
      if (viewModel.profileImage != null) {
        disabled = false;
      }
      return SignupProfileWrapper(
        contents: const SignupProfileImageContent(),
        disableNextButton: disabled,
        onNextPage: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return const SignupProfileImagePage();
          //     },
          //   ),
          // );
        },
      );
    });
  }
}
