import 'package:chemiplay/presentation/views/signup/profile/widgets/signup_profile_title.dart';
import 'package:chemiplay/presentation/widgets/gigi_text_field.dart';
import 'package:flutter/material.dart';

class SignupProfileNicknameContent extends StatelessWidget {
  final TextEditingController textController;
  const SignupProfileNicknameContent({
    super.key,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SignupProfileTitle(
          title: '닉네임:',
        ),
        GigiTextField(
          labelText: '닉네임',
          hintText: '닉네임',
          controller: textController,
          validator: (String? value) {
            if (value == 'nickname') {
              return '이미 사용중인 닉네임입니다.';
            }
            return null;
          },
        ),
      ],
    );
  }
}
