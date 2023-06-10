import 'package:chemiplay/presentation/views/signup/widgets/app_bar_lead_icon.dart';
import 'package:chemiplay/presentation/views/signup/widgets/bottom_next_button.dart';
import 'package:chemiplay/presentation/widgets/gigi_app_bar.dart';
import 'package:flutter/material.dart';

class SignupProfileWrapper extends StatefulWidget {
  final PageController pageController;
  final VoidCallback onNextPage;
  final bool disableNextButton;
  final Widget contents;

  const SignupProfileWrapper({
    super.key,
    required this.onNextPage,
    required this.contents,
    required this.disableNextButton,
    required this.pageController,
  });

  @override
  State<SignupProfileWrapper> createState() => _SignupProfileWrapperState();
}

class _SignupProfileWrapperState extends State<SignupProfileWrapper> {
  String? gender;
  final inActiveBackgroundColor = Colors.white;
  final inActiveShadowColor = const Color(0xffe3e6eb);
  final activeBackgroundColor = const Color(0xFFFF8066);
  final activeShadowColor = const Color(0xFF4D4D4D);

  void selectGender(String gender) {
    setState(() {
      this.gender = gender;
    });
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onBackIconTap() {
    widget.pageController.previousPage(
      duration: const Duration(milliseconds: 150),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: GigiAppBar(
          leading: AppBarLeadIcon(
            context: context,
            onPressed: _onBackIconTap,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: widget.contents,
        ),
        bottomSheet: BottomNextButton(
          disabled: widget.disableNextButton,
          onPressed: widget.onNextPage,
        ),
      ),
    );
  }
}
