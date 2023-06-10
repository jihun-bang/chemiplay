import 'package:chemiplay/injection.dart';
import 'package:chemiplay/presentation/viewmodels/signup_profile_viewmodel.dart';
import 'package:chemiplay/presentation/views/signup/profile/signup_profile_gender_page.dart';
import 'package:chemiplay/presentation/views/signup/profile/signup_profile_image_page.dart';
import 'package:chemiplay/presentation/views/signup/profile/signup_profile_nickname_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SignupProfilePage extends StatefulWidget {
  const SignupProfilePage({super.key});

  @override
  State<SignupProfilePage> createState() => _SignupProfilePageState();
}

class _SignupProfilePageState extends State<SignupProfilePage> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignupProfileViewModel>(
      create: (context) => getIt(),
      child: PageView(
        controller: _pageController,
        children: [
          SignupProfileGenderPage(
            pageController: _pageController,
          ),
          SignupProfileNicknamePage(
            pageController: _pageController,
          ),
          SignupProfileImagePage(
            pageController: _pageController,
          )
        ],
      ),
    );
  }
}
