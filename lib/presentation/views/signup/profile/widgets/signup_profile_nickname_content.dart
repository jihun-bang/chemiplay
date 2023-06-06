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
    return GigiTextField(
      labelText: '닉네임',
      hintText: '닉네임',
      controller: textController,
    );
  }
}
