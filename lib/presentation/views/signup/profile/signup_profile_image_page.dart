import 'package:chemiplay/presentation/views/signup/profile/layout/signup_profile_layout.dart';
import 'package:flutter/material.dart';

class SignupProfileImagePage extends StatefulWidget {
  const SignupProfileImagePage({super.key});

  @override
  State<SignupProfileImagePage> createState() => _SignupProfileImagePageState();
}

class _SignupProfileImagePageState extends State<SignupProfileImagePage> {
  bool disabled = true;
  void setDisabledFalse() {
    if (disabled == true) {
      disabled = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SignupProfileLayout(
      crossAxisAlignment: CrossAxisAlignment.center,
      title: '프로필 사진 추가',
      contents: Container(),
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
  }
}
