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
  final activeShadowColor = const Color(0xffFF8066);

  final titleTextStyle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Color(0xff2B2B2B),
  );

  final subTitleTextStyle = const TextStyle(
    fontSize: 18,
    color: Color(0xff8A9099),
  );

  final DateTime initialDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GigiAppBar(
        title: '게임 메이트 프로필',
      ),
      body: Padding(
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
            GigiTextField(onChanged: (value) {}),
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
                  width: 20,
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
              enabled: false,
              onChanged: (value) {},
              suffixIcon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Color(0xff404040),
                size: 24,
              ),
              onSuffixIconTap: () {},
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
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 300,
          child: CupertinoDatePicker(
            maximumDate: initialDate,
            initialDateTime: initialDate,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (dateTime) {},
          ),
        ),
      ),
    );
  }
}
