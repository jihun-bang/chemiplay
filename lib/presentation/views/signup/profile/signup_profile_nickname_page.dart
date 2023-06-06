import 'package:chemiplay/presentation/views/signup/profile/widgets/signup_profile_layout.dart';
import 'package:chemiplay/presentation/views/signup/profile/signup_profile_image_page.dart';
import 'package:chemiplay/presentation/views/signup/profile/widgets/signup_profile_nickname_content.dart';
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
      contents: SignupProfileNicknameContent(
        textController: textController,
      ),
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
  }
}
