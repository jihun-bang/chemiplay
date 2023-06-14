import 'package:chemiplay/presentation/widgets/gigi_app_bar.dart';
import 'package:chemiplay/presentation/widgets/gigi_elevated_button.dart';
import 'package:chemiplay/presentation/widgets/gigi_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MateProfileSettingPage extends StatefulWidget {
  const MateProfileSettingPage({super.key});

  @override
  State<MateProfileSettingPage> createState() => _MateProfileSettingPageState();
}

class _MateProfileSettingPageState extends State<MateProfileSettingPage> {
  final inActiveBackgroundColor = Colors.white;
  final inActiveShadowColor = const Color(0xffe3e6eb);
  final activeBackgroundColor = const Color(0xffFFF0ED);
  final Color primaryColor = const Color(0xFFFF8066);
  final activeShadowColor = const Color(0xffFF8066);
  final TextEditingController _nicknameController =
      TextEditingController(text: '유저의닉네임');
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _introductionController = TextEditingController();

  final titleTextStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Color(0xff2B2B2B),
  );

  final subTitleTextStyle = const TextStyle(
    fontSize: 16,
    color: Color(0xff8A9099),
  );

  final DateTime initialDate = DateTime.now();

  bool isNeedToShowIntroductionLableText = true;

  void _setIsNeedToShowIntroductionLableText(bool value) {
    if (isNeedToShowIntroductionLableText != value) {
      setState(() {
        isNeedToShowIntroductionLableText = value;
      });
    }
  }

  void _setBirthdayText(DateTime date) {
    final textDate = date.toString().split(" ").first;
    setState(() {
      _birthdayController.value = TextEditingValue(text: textDate);
    });
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    _birthdayController.dispose();
    _introductionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const GigiAppBar(
        title: '게임 메이트 프로필',
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                '닉네임',
                style: titleTextStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '매주 한 번씩만 변경 가능해요.',
                style: subTitleTextStyle,
              ),
              GigiTextField(
                readOnly: true,
                onChanged: (value) {},
                textController: _nicknameController,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '성별',
                style: titleTextStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '선택 후, 성별은 변경할 수 없어요.',
                style: subTitleTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: GigiElevatedButton(
                      text: '남성',
                      backgroundColor: inActiveBackgroundColor,
                      shadowColor: inActiveShadowColor,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: GigiElevatedButton(
                      text: '여성',
                      backgroundColor: inActiveBackgroundColor,
                      shadowColor: inActiveShadowColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '생일',
                style: titleTextStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '만 19세 이상만 신청할 수 있어요.',
                style: subTitleTextStyle,
              ),
              GigiTextField(
                readOnly: true,
                textController: _birthdayController,
                labelText: '생년월일을 선택해주세요',
                labelStyle: const TextStyle(
                  color: Color(0xffCED3D9),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                suffixIcon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Color(0xff404040),
                  size: 24,
                ),
                onTap: () {
                  if (_birthdayController.text == '') {
                    _setBirthdayText(initialDate);
                  }
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return Container(
                        clipBehavior: Clip.hardEdge,
                        height: 300,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14),
                          ),
                        ),
                        child: CupertinoDatePicker(
                          maximumDate: initialDate,
                          initialDateTime: initialDate,
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: _setBirthdayText,
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '자기소개',
                style: titleTextStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '자세히 적을 수록 매치 가능성이 높아져요.\n예시) 취미, 최애게임, 플레이 스타일, 편한 시간대 등',
                style: subTitleTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      color: Color(0xffF5F7FA),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: TextField(
                      controller: _introductionController,
                      decoration: const InputDecoration(
                        counterText: '',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(20),
                      ),
                      keyboardType: TextInputType.multiline,
                      cursorColor: primaryColor,
                      minLines: 10,
                      maxLines: 10,
                      maxLength: 200,
                      onTap: () => _setIsNeedToShowIntroductionLableText(false),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Text(
                      '자기소개를 써주세요.',
                      style: TextStyle(
                        color: isNeedToShowIntroductionLableText == false
                            ? Colors.transparent
                            : const Color(0xffCED3D9),
                      ),
                    ),
                  ),
                  const Positioned(
                    right: 20,
                    bottom: 20,
                    child: Text(
                      '200/200',
                      style: TextStyle(
                        color: Color(0xffAEB4BD),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        decoration: const BoxDecoration(color: Colors.transparent),
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 40),
        child: GigiElevatedButton(
          text: '다음',
          backgroundColor: inActiveBackgroundColor,
          shadowColor: inActiveShadowColor,
        ),
      ),
    );
  }
}
