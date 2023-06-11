import 'package:chemiplay/utils/colors.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    fontFamily: 'Pretendard',
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontFamily: 'Pretendard', letterSpacing: -0.02),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    ),
    scaffoldBackgroundColor: MyColors.gray_01,
    appBarTheme: AppBarTheme(
        color: MyColors.gray_01,
        toolbarHeight: 48,
        titleSpacing: 24,
        foregroundColor: Colors.black));
