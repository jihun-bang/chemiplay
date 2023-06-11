import 'package:chemiplay/injection.dart';
import 'package:chemiplay/presentation/viewmodels/signup_profile_viewmodel.dart';
import 'package:chemiplay/presentation/views/signup/profile/widgets/signup_profile_gender_content.dart';
import 'package:chemiplay/presentation/views/signup/profile/widgets/signup_profile_image_content.dart';
import 'package:chemiplay/presentation/views/signup/profile/widgets/signup_profile_nickname_content.dart';
import 'package:chemiplay/presentation/views/signup/profile/widgets/signup_profile_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignupProfilePage extends StatefulWidget {
  const SignupProfilePage({super.key});

  @override
  State<SignupProfilePage> createState() => _SignupProfilePageState();
}

class _SignupProfilePageState extends State<SignupProfilePage> {
  var _signupProfileViewModel = getIt<SignupProfileViewModel>();
  final _pageController = PageController(initialPage: 0);
  int page = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> onImagePageNextTap() async {
    // validate image exist
    // upload image
    await _signupProfileViewModel.uploadProfileImage();
    // update user
    await _signupProfileViewModel.updateUserProfile();
    // go home
    GoRouter.of(context).goNamed('home');
  }

  Future<void> onImagePageSkipTap() async {
    // update user
    await _signupProfileViewModel.updateUserProfile();
    // go home
    GoRouter.of(context).goNamed('home');
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignupProfileViewModel>(
      create: (context) => getIt(),
      child: Consumer<SignupProfileViewModel>(builder: (context, viewModel, _) {
        _signupProfileViewModel = viewModel;
        return SignupProfileWrapper(
          onNextPage: () {
            if (_signupProfileViewModel.page == 0 ||
                _signupProfileViewModel.page == 1) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 150),
                curve: Curves.linear,
              );
            } else {
              onImagePageNextTap();
            }
          },
          contents: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const SignupProfileGenderContent(),
              const SignupProfileNicknameContent(),
              SignupProfileImageContent(onSkipTap: onImagePageSkipTap)
            ],
            onPageChanged: (page) {
              _signupProfileViewModel.setNextButtonDisabled(true);
              _signupProfileViewModel.setPage(page);
            },
          ),
          pageController: _pageController,
          page: _signupProfileViewModel.page,
          disableNextButton: _signupProfileViewModel.nextButtonDisabled,
        );
      }),
      // child: PageView(
      //   controller: _pageController,
      //   children: [
      //     SignupProfileGenderPage(
      //       pageController: _pageController,
      //     ),
      //     SignupProfileNicknamePage(
      //       pageController: _pageController,
      //     ),
      //     SignupProfileImagePage(
      //       pageController: _pageController,
      //     )
      //   ],
      // ),
    );
  }
}
