import 'package:chemiplay/presentation/dialog/toast.dart';
import 'package:chemiplay/presentation/viewmodels/user_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';

class VerifyPhoneNumberViewModel extends ChangeNotifier {
  final UserViewModel _userViewModel;

  VerifyPhoneNumberViewModel(this._userViewModel);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _phoneNumber;
  String? get phoneNumber => _phoneNumber;
  String? _verificationId;
  String status = 'ready';

  void setPhoneNumber(String phoneNumber) {
    status = 'ready';
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  Future<void> sendSMS(BuildContext context, VoidCallback? showModal) async {
    if (!isValidKoreanPhoneNumber(_phoneNumber)) {
      return showToast(context: context, message: '유효하지 않은 핸드폰 번호입니다.');
    }
    if (status != 'pending') {
      status = 'pending';
      await _auth.verifyPhoneNumber(
        phoneNumber: formatPhoneNumber(_phoneNumber!),
        verificationCompleted: (PhoneAuthCredential credential) async {
          print('test1');
          notifyListeners();
        },
        verificationFailed: (FirebaseAuthException e) {
          status = 'failed';
          showToast(context: context, message: '메시지 전송에 실패했습니다.');
          notifyListeners();
        },
        codeSent: (String verificationId, int? resendToken) async {
          _verificationId = verificationId; // 인증 코드 확인때 필요한 값
          status = 'sent';
          if (showModal != null) {
            showModal();
          }
          showToast(context: context, message: '메시지 전송했습니다.');
          notifyListeners();
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }
  }

  Future<bool> verifyCode(String code) async {
    if (_verificationId != null) {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: code,
      );
      try {
        // final UserCredential authCredential =
        await _auth.signInWithCredential(credential);
      } catch (e) {
        return false;
      }

      // 인증 완료 되었을 시
      await _userViewModel.updatePhoneNumber(_phoneNumber!);
      return true;
    }
    return false;
  }

  bool isValidKoreanPhoneNumber(String? input) {
    if (input == null) {
      return false;
    }
    // 한국식 휴대폰 번호의 정규 표현식
    RegExp regex = RegExp(r'^01(?:0|1|[6-9])(?:\d{7,8}|\d{3,4}\d{4})$');
    return regex.hasMatch(input);
  }

  String formatPhoneNumber(String input) {
    if (isValidKoreanPhoneNumber(input)) {
      // 첫 번째 숫자가 0인지 확인하고, 그렇다면 +82를 붙히고, 아니면 그대로 +82를 붙히기
      return input.startsWith('0') ? '+82${input.substring(1)}' : '+82$input';
    }
    throw BadRequestError();
  }
}
