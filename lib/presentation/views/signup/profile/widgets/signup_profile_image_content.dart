import 'dart:io';

import 'package:chemiplay/injection.dart';
import 'package:chemiplay/presentation/viewmodels/signup_profile_viewmodel.dart';
import 'package:chemiplay/presentation/views/signup/profile/widgets/signup_profile_title.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SignupProfileImageContent extends StatefulWidget {
  final VoidCallback onSkipTap;
  const SignupProfileImageContent({
    super.key,
    required this.onSkipTap,
  });

  @override
  State<SignupProfileImageContent> createState() =>
      _SignupProfileImageContentState();
}

class _SignupProfileImageContentState extends State<SignupProfileImageContent> {
  var _signupProfileViewModel = getIt<SignupProfileViewModel>();
  Future<void> _onPickImagePressed() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    _signupProfileViewModel.setProfileImage(image);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupProfileViewModel>(builder: (context, viewModel, _) {
      _signupProfileViewModel = viewModel;
      return Column(
        children: [
          const SignupProfileTitle(
            title: '프로필 사진 추가',
          ),
          const SizedBox(
            height: 48,
          ),
          Center(
            child: GestureDetector(
              onTap: _onPickImagePressed,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 65,
                    foregroundImage: _signupProfileViewModel.profileImage !=
                            null
                        ? FileImage(
                            File(_signupProfileViewModel.profileImage!.path))
                        : null,
                    backgroundColor: Colors.transparent,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffFFB9A9),
                      ),
                      width: 130,
                      height: 130,
                      child: Transform.translate(
                        offset: const Offset(-10, 8),
                        child: const Icon(
                          Icons.person,
                          size: 150,
                          color: Color(0xffFFE7E1),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 5,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff2b2b2b),
                      ),
                      height: 30,
                      width: 30,
                      child: Icon(
                        _signupProfileViewModel.profileImage != null
                            ? Icons.edit
                            : Icons.add,
                        size: 25,
                        color: const Color(0xffe4e4e4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 150),
                child: GestureDetector(
                  onTap: widget.onSkipTap,
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
          ),
        ],
      );
    });
  }
}
