import 'package:chemiplay/presentation/views/signup/widgets/app_bar_lead_icon.dart';
import 'package:chemiplay/presentation/views/signup/widgets/bottom_next_button.dart';
import 'package:chemiplay/presentation/widgets/gigi_app_bar.dart';
import 'package:flutter/material.dart';

class SignupProfileLayout extends StatefulWidget {
  final VoidCallback onNextPage;
  final bool disableNextButton;
  final String title, subTitle;
  final Widget contents;
  final CrossAxisAlignment crossAxisAlignment;

  const SignupProfileLayout({
    super.key,
    required this.onNextPage,
    required this.title,
    this.subTitle = '',
    required this.contents,
    required this.disableNextButton,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  State<SignupProfileLayout> createState() => _SignupProfileLayoutState();
}

class _SignupProfileLayoutState extends State<SignupProfileLayout> {
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: GigiAppBar(
          leading: AppBarLeadIcon(context: context),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 64,
              ),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                widget.subTitle,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              widget.contents,
            ],
          ),
        ),
        bottomSheet: BottomNextButton(
          disabled: widget.disableNextButton,
          onPressed: widget.onNextPage,
        ),
      ),
    );
  }
}
