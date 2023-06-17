import 'package:chemiplay/injection.dart';
import 'package:chemiplay/presentation/viewmodels/user_viewmodel.dart';
import 'package:chemiplay/presentation/views/my/widgets/my_mate_verify_phone_number_modal.dart';
import 'package:chemiplay/presentation/widgets/bottom_next_button.dart';
import 'package:chemiplay/presentation/widgets/gigi_app_bar.dart';
import 'package:chemiplay/presentation/widgets/gigi_text_field.dart';
import 'package:flutter/material.dart';

class MyMateVerifyPhoneNumberPage extends StatefulWidget {
  const MyMateVerifyPhoneNumberPage({super.key});

  @override
  State<MyMateVerifyPhoneNumberPage> createState() =>
      _MyMateVerifyPhoneNumberPageState();
}

class _MyMateVerifyPhoneNumberPageState
    extends State<MyMateVerifyPhoneNumberPage> {
  final UserViewModel _userViewModel = getIt();
  final TextEditingController _phoneNumberTextController =
      TextEditingController();
  final TextEditingController _verificationCodeTextController =
      TextEditingController();
  final FocusNode _verificationCodeTextFieldFocusNode = FocusNode();

  @override
  void dispose() {
    _phoneNumberTextController.dispose();
    _verificationCodeTextController.dispose();
    _verificationCodeTextFieldFocusNode.dispose();
    super.dispose();
  }

  Future<void> _sendVerificationCode(String number) async {
    //Verification 전송 로직
  }

  void _onVerificationCodeInput(String value) async {
    if (value.length == 6) {
      // Verification Code 검증
      // User데이터베이스에 phoneNumber 저장
      // 게임 메이트 되기 페이지로 이동
    }
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
              textController: _phoneNumberTextController,
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
        onPressed: () async {
          await _sendVerificationCode(_phoneNumberTextController.text);
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) {
              // 인증코드 텍스트필드 포커스
              _verificationCodeTextFieldFocusNode.requestFocus();

              // 모달띄우기
              return MyMateVerifyPhoneNumberModal(
                phoneNumber: _phoneNumberTextController.text,
                textController: _verificationCodeTextController,
                textFieldFocusNode: _verificationCodeTextFieldFocusNode,
                onChanged: _onVerificationCodeInput,
                sendVerificationCode: _sendVerificationCode,
              );
            },
          );
        },
      ),
    );
  }
}
