import 'package:chemiplay/data/models/user.dart';
import 'package:chemiplay/injection.dart';
import 'package:chemiplay/presentation/viewmodels/my_mate_profile_viewmodel.dart';
import 'package:chemiplay/presentation/viewmodels/user_viewmodel.dart';
import 'package:chemiplay/presentation/widgets/gigi_alert_dialog.dart';
import 'package:chemiplay/presentation/widgets/gigi_app_bar.dart';
import 'package:chemiplay/presentation/widgets/gigi_elevated_button.dart';
import 'package:chemiplay/presentation/widgets/gigi_multiline_textfield.dart';
import 'package:chemiplay/presentation/widgets/gigi_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyMateProfilePage extends StatefulWidget {
  const MyMateProfilePage({super.key});

  @override
  State<MyMateProfilePage> createState() => _MyMateProfilePageState();
}

class _MyMateProfilePageState extends State<MyMateProfilePage> {
  final inActiveBackgroundColor = Colors.white;
  final inActiveShadowColor = const Color(0xffe3e6eb);
  final activeBackgroundColor = const Color(0xffFFF0ED);
  final activeShadowColor = const Color(0xffFF8066);
  final Color primaryColor = const Color(0xFFFF8066);
  final _userViewModel = getIt<UserViewModel>();
  late MyMateProfileViewModel _myMateProfileViewModel;

  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _introductionController = TextEditingController();

  final titleTextStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Color(0xff2B2B2B),
  );

  final descriptionTextStyle = const TextStyle(
    fontSize: 16,
    color: Color(0xff8A9099),
  );

  final DateTime initialDate = DateTime.now();

  void _setIntroductionText(String introductionText) {
    if (introductionText.length == 200) {
      showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          // Future.delayed(const Duration(seconds: 3), () {
          //   Navigator.pop(context);
          // });
          // return object of type Dialog
          return const GigiAlertDialog(
            text: '200자 이내로 적어주세요.',
          );
        },
      );
    }
    _myMateProfileViewModel.setIntroduction(introductionText);
  }

  void _setBirthdayText(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
    _myMateProfileViewModel.setBirthday(textDate);
  }

  void _setGender(Gender gender) {
    _myMateProfileViewModel.setGender(gender);
  }

  void _onBirthdayTextFieldTap() {
    if (_birthdayController.text == '') {
      _setBirthdayText(initialDate);
    }
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return _bottomDatePicker;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _myMateProfileViewModel = getIt<MyMateProfileViewModel>();
    if (_myMateProfileViewModel.nickname != null) {
      _nicknameController.value =
          TextEditingValue(text: _myMateProfileViewModel.nickname!);
    }
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
    return ChangeNotifierProvider<MyMateProfileViewModel>(
      create: (context) => getIt(),
      child: Consumer<MyMateProfileViewModel>(builder: (context, viewModel, _) {
        _myMateProfileViewModel = viewModel;
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
                  ..._getMateProfileSettingRow(
                    title: '닉네임',
                    description: '매주 한 번씩만 변경 가능해요.',
                    widget: GigiTextField(
                      enabled: false,
                      onChanged: (value) {},
                      textController: _nicknameController,
                    ),
                  ),
                  ..._getMateProfileSettingRow(
                    title: '성별',
                    description: '선택 후, 성별은 변경할 수 없어요.',
                    widget: Row(
                      children: [
                        Expanded(
                          child: GigiElevatedButton(
                            text: '남성',
                            backgroundColor:
                                _myMateProfileViewModel.gender == Gender.male
                                    ? activeBackgroundColor
                                    : inActiveBackgroundColor,
                            shadowColor:
                                _myMateProfileViewModel.gender == Gender.male
                                    ? activeShadowColor
                                    : inActiveShadowColor,
                            onPressed: () => _setGender(Gender.male),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: GigiElevatedButton(
                            text: '여성',
                            backgroundColor:
                                _myMateProfileViewModel.gender == Gender.female
                                    ? activeBackgroundColor
                                    : inActiveBackgroundColor,
                            shadowColor:
                                _myMateProfileViewModel.gender == Gender.female
                                    ? activeShadowColor
                                    : inActiveShadowColor,
                            onPressed: () => _setGender(Gender.female),
                          ),
                        ),
                      ],
                    ),
                    middlePadding: 20,
                  ),
                  ..._getMateProfileSettingRow(
                    title: '생일',
                    description: '만 19세 이상만 신청할 수 있어요.',
                    widget: GigiTextField(
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
                      onTap: _onBirthdayTextFieldTap,
                    ),
                  ),
                  ..._getMateProfileSettingRow(
                    title: '자기소개',
                    description:
                        '자세히 적을 수록 매치 가능성이 높아져요.\n예시) 취미, 최애게임, 플레이 스타일, 편한 시간대 등',
                    widget: GigiMultilineTextField(
                      textController: _introductionController,
                      onChanged: (introductionText) =>
                          _setIntroductionText(introductionText),
                      labelText: '자기소개를 써주세요.',
                      maxLength: 200,
                    ),
                    middlePadding: 10,
                  ),
                ],
              ),
            ),
          ),
          bottomSheet: Container(
            decoration: const BoxDecoration(color: Colors.white),
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 40),
            child: const GigiElevatedButton(
              text: '다음',
              backgroundColor: Color(0xffFFBFB2),
              shadowColor: Color(0xff9F9F9F),
              disabled: true,
            ),
          ),
        );
      }),
    );
  }

  List<Widget> _getMateProfileSettingRow({
    double topPadding = 20,
    double middlePadding = 0,
    required String title,
    required String description,
    required Widget widget,
  }) {
    return [
      SizedBox(
        height: topPadding,
      ),
      Text(
        title,
        style: titleTextStyle,
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        description,
        style: descriptionTextStyle,
      ),
      SizedBox(
        height: middlePadding,
      ),
      widget
    ];
  }

  Widget get _bottomDatePicker => Container(
        clipBehavior: Clip.hardEdge,
        height: 300,
        decoration: const BoxDecoration(
          color: Color(0xffF4F4F7),
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
}
