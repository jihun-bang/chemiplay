import 'package:chemiplay/injection.dart';
import 'package:chemiplay/presentation/viewmodels/timer_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MyMateVerifyPhoneNumberModal extends StatefulWidget {
  final String phoneNumber;
  final TextEditingController textController;
  final FocusNode textFieldFocusNode;
  final void Function(String) onChanged;
  final Future<void> Function(String) sendVerificationCode;
  TimerViewModel _timerViewModel = getIt();

  MyMateVerifyPhoneNumberModal({
    super.key,
    required this.phoneNumber,
    required this.textController,
    required this.textFieldFocusNode,
    required this.onChanged,
    required this.sendVerificationCode,
  });

  @override
  State<MyMateVerifyPhoneNumberModal> createState() =>
      _MyMateVerifyPhoneNumberModalState();
}

class _MyMateVerifyPhoneNumberModalState
    extends State<MyMateVerifyPhoneNumberModal> {
  final int totalSeconds = 60 * 3;

  Future<void> _onResendVerificationCode() async {
    await widget.sendVerificationCode(widget.phoneNumber);
    widget._timerViewModel.resetAndStartTimer();
  }

  void _onTimerFinished() {
    // 타이머 끝났을 때
  }

  @override
  void initState() {
    super.initState();
    widget._timerViewModel
        .init(totalSeconds: totalSeconds, onFinished: _onTimerFinished);
    widget._timerViewModel.resetAndStartTimer();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerViewModel>(
      create: (context) => widget._timerViewModel,
      child: Consumer<TimerViewModel>(builder: (context, viewModel, _) {
        widget._timerViewModel = viewModel;
        final leftDuration =
            Duration(seconds: widget._timerViewModel.timerSecond);
        return Container(
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
                            onTap: _onResendVerificationCode,
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
                  widget.phoneNumber,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xffAEB4BD),
                  ),
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: widget.textController,
                  focusNode: widget.textFieldFocusNode,
                  textAlign: TextAlign.center,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    counterText: '',
                  ),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  onChanged: widget.onChanged,
                  autocorrect: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  leftDuration.toString().split('.').first.substring(2, 7),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
