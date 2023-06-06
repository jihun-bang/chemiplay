import 'package:chemiplay/presentation/views/signup/profile/layout/signup_profile_layout.dart';
import 'package:chemiplay/presentation/views/signup/profile/signup_profile_nickname_page.dart';
import 'package:chemiplay/presentation/views/signup/profile/widgets/signup_profile_gender_contents.dart';
import 'package:flutter/material.dart';

class SignupProfileGenderPage extends StatefulWidget {
  const SignupProfileGenderPage({super.key});

  @override
  State<SignupProfileGenderPage> createState() =>
      _SignupProfileGenderPageState();
}

class _SignupProfileGenderPageState extends State<SignupProfileGenderPage> {
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
      title: '성별:',
      subTitle: '프로필에 보여집니다.',
      contents: SignupProfileGenderContents(setDisabledFalse: setDisabledFalse),
      disableNextButton: disabled,
      onNextPage: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const SignupProfileNicknamePage();
            },
          ),
        );
      },
    );
  }
}
