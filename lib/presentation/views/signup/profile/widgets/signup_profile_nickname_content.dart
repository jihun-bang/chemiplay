import 'package:chemiplay/injection.dart';
import 'package:chemiplay/presentation/viewmodels/signup_profile_viewmodel.dart';
import 'package:chemiplay/presentation/views/signup/profile/widgets/signup_profile_title.dart';
import 'package:chemiplay/presentation/widgets/gigi_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupProfileNicknameContent extends StatefulWidget {
  const SignupProfileNicknameContent({
    super.key,
  });

  @override
  State<SignupProfileNicknameContent> createState() =>
      _SignupProfileNicknameContentState();
}

class _SignupProfileNicknameContentState
    extends State<SignupProfileNicknameContent> {
  var _signupProfileViewModel = getIt<SignupProfileViewModel>();

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupProfileViewModel>(builder: (context, viewModel, _) {
      _signupProfileViewModel = viewModel;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SignupProfileTitle(
              title: '닉네임:',
            ),
            GigiTextField(
              labelText: '닉네임',
              hintText: '닉네임',
              onChanged: (nickname) =>
                  _signupProfileViewModel.setNickname(nickname),
            ),
          ],
        ),
      );
    });
  }
}
