import 'package:chemiplay/presentation/widgets/gigi_elevated_button.dart';
import 'package:flutter/material.dart';

class SignupProfileGenderContents extends StatefulWidget {
  final VoidCallback setDisabledFalse;
  const SignupProfileGenderContents({
    super.key,
    required this.setDisabledFalse,
  });

  @override
  State<SignupProfileGenderContents> createState() =>
      _SignupProfileGenderContentsState();
}

class _SignupProfileGenderContentsState
    extends State<SignupProfileGenderContents> {
  String? gender;
  final inActiveBackgroundColor = Colors.white;
  final inActiveShadowColor = const Color(0xffe3e6eb);
  final activeBackgroundColor = const Color(0xFFFF8066);
  final activeShadowColor = const Color(0xFF4D4D4D);

  void selectGender(String gender) {
    widget.setDisabledFalse();
    setState(() {
      this.gender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 48,
        ),
        GigiElevatedButton(
          text: '여성',
          onPressed: () => selectGender('여성'),
          backgroundColor:
              gender == '여성' ? activeBackgroundColor : inActiveBackgroundColor,
          shadowColor: gender == '여성' ? activeShadowColor : inActiveShadowColor,
        ),
        const SizedBox(
          height: 16,
        ),
        GigiElevatedButton(
          text: '남성',
          onPressed: () => selectGender('남성'),
          backgroundColor:
              gender == '남성' ? activeBackgroundColor : inActiveBackgroundColor,
          shadowColor: gender == '남성' ? activeShadowColor : inActiveShadowColor,
        ),
      ],
    );
  }
}
