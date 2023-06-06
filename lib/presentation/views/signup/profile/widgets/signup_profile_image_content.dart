import 'dart:math';

import 'package:chemiplay/presentation/views/signup/profile/widgets/signup_profile_title.dart';
import 'package:flutter/material.dart';

class SignupProfileImageContent extends StatefulWidget {
  const SignupProfileImageContent({super.key});

  @override
  State<SignupProfileImageContent> createState() =>
      _SignupProfileImageContentState();
}

class _SignupProfileImageContentState extends State<SignupProfileImageContent> {
  @override
  Widget build(BuildContext context) {
    bool isModification = Random().nextBool();
    return Column(
      children: [
        const SignupProfileTitle(
          title: '프로필 사진 추가',
        ),
        const SizedBox(
          height: 48,
        ),
        Center(
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffFFB9A9),
                  ),
                  height: 130,
                  child: Transform.translate(
                    offset: const Offset(0, 8),
                    child: const Icon(
                      Icons.person,
                      size: 150,
                      color: Color(0xffFFE7E1),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff2b2b2b),
                  ),
                  height: 30,
                  width: 30,
                  child: Icon(
                    isModification ? Icons.edit : Icons.add,
                    size: 25,
                    color: const Color(0xffe4e4e4),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 150),
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black, width: 1.5),
                  ),
                ),
                child: const Text(
                  '나중에 설정하기',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
