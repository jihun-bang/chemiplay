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
  DateTime? _last_sent_at;
  int _failedCount = 0;

  String _sendStatus = 'ready';

  void setPhoneNumber(String phoneNumber) {
    _sendStatus = 'ready';
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  Future<void> sendSMS(BuildContext context, VoidCallback? showModal) async {
    if (!isValidKoreanPhoneNumber(_phoneNumber)) {
      return showToast(context: context, message: '유효하지 않은 핸드폰 번호입니다.');
    }
    if (_last_sent_at != null) {
      DateTime oneMinuteAgo =
          DateTime.now().subtract(const Duration(minutes: 1));
      if (oneMinuteAgo.isBefore(_last_sent_at!)) {
        return showToast(
            context: context, message: '메시지는 전송 후 1분간 재전송이 불가합니다.');
      }
    }
    if (_sendStatus != 'pending') {
      _sendStatus = 'pending';
      await _auth.verifyPhoneNumber(
        phoneNumber: formatPhoneNumber(_phoneNumber!),
        verificationCompleted: (PhoneAuthCredential credential) async {
          print('test1');
          notifyListeners();
        },
        verificationFailed: (FirebaseAuthException e) {
          _sendStatus = 'failed';
          showToast(
              context: context, message: '메시지 전송에 실패했습니다.(CODE: ${e.code})');
          notifyListeners();
        },
        codeSent: (String verificationId, int? resendToken) async {
          _verificationId = verificationId; // 인증 코드 확인때 필요한 값
          _last_sent_at = DateTime.now();
          _sendStatus = 'sent';
          _failedCount = 0;
          if (showModal != null) {
            showModal();
          }
          showToast(context: context, message: '메시지 전송했습니다.');
          notifyListeners();
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        timeout: const Duration(minutes: 3),
      );
    }
  }

  Future<bool> verifyCode(String code) async {
    if (_verificationId != null) {
      if (_failedCount > 10) {
        throw BadRequestError(
          message: 'failed too many time',
          code: 429,
        );
      }
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: code,
      );
      try {
        // final UserCredential authCredential =
        await _auth.signInWithCredential(credential);
      } catch (e) {
        _failedCount++;
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
