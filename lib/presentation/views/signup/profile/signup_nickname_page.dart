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

  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    textController.addListener(() {
      final value = textController.value.text;
      if (value.isNotEmpty && disabled == true) {
        setState(() {
          disabled = false;
        });
      } else if (value.isEmpty && disabled == false) {
        setState(() {
          disabled = true;
        });
      }
    });
    return SignupProfileLayout(
      title: '내 닉네임:',
      contents: Column(
        children: [
          GigiTextField(
            labelText: '닉네임',
            hintText: '닉네임',
            controller: textController,
          ),
        ],
      ),
      disableNextButton: disabled,
      onNextPage: () {},
    );
  }
}
