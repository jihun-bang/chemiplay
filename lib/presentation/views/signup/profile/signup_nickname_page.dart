import 'package:chemiplay/presentation/views/signup/profile/layout/signup_profile_layout.dart';
import 'package:chemiplay/presentation/widgets/gigi_text_field.dart';
import 'package:flutter/material.dart';

class SignupProfileNicknamePage extends StatefulWidget {
  const SignupProfileNicknamePage({super.key});

  @override
  State<SignupProfileNicknamePage> createState() =>
      _SignupProfileNicknamePageState();
}

class _SignupProfileNicknamePageState extends State<SignupProfileNicknamePage> {
  bool disabled = true;
  void _onTextChange(String value) {
    if (value.isNotEmpty && disabled == true) {
      setState(() {
        disabled = false;
      });
    } else if (value.isEmpty && disabled == false) {
      setState(() {
        disabled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SignupProfileLayout(
      title: '내 닉네임:',
      contents: Column(
        children: [
          GigiTextField(
            labelText: '닉네임',
            hintText: '닉네임',
            onChange: _onTextChange,
          ),
        ],
      ),
      disableNextButton: disabled,
      onNextPage: () {},
    );
  }
}
