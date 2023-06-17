import 'package:chemiplay/presentation/widgets/bottom_next_button.dart';
import 'package:chemiplay/presentation/widgets/gigi_app_bar.dart';
import 'package:chemiplay/presentation/widgets/gigi_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyMateVerifyPhoneNumberPage extends StatefulWidget {
  const MyMateVerifyPhoneNumberPage({super.key});

  @override
  State<MyMateVerifyPhoneNumberPage> createState() =>
      _MyMateVerifyPhoneNumberPageState();
}

class _MyMateVerifyPhoneNumberPageState
    extends State<MyMateVerifyPhoneNumberPage> {
  final TextEditingController _textController = TextEditingController();
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GigiAppBar(
        title: '휴대폰 번호 연동',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 64,
            ),
            const Text(
              '휴대폰 번호를 입력해주세요.',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            GigiTextField(
              labelText: '휴대폰 번호',
              textController: _textController,
              keyboardType: TextInputType.phone,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              // onChanged: (nickname) =>
              //     _signupProfileViewModel.setNickname(nickname),
            ),
          ],
        ),
      ),
      bottomSheet: BottomNextButton(
        text: '인증번호 발송',
        disabled: false,
        onPressed: () => showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return getVerifyPhoneNumberBottomWidget(
              phoneNumber: '010-3177-3391',
            );
          },
        ),
      ),
    );
  }

  Widget getVerifyPhoneNumberBottomWidget({required String phoneNumber}) =>
      Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14), topRight: Radius.circular(14)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.passthrough,
                  children: [
                    const Positioned(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '인증번호 입력',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          child: SvgPicture.asset(
                            'assets/icons/icon_renew.svg',
                            width: 22,
                            height: 22,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Text(
                phoneNumber,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xffAEB4BD),
                ),
              ),
              const SizedBox(height: 50),
              const TextField(
                textAlign: TextAlign.center,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  counterText: '',
                ),
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
                keyboardType: TextInputType.number,
                maxLength: 6,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                '01:20',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
}
