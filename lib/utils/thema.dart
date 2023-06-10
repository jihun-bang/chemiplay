import 'package:chemiplay/utils/colors.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    fontFamily: 'Pretandard',
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontFamily: 'Pretandard', letterSpacing: -0.02),
    ),
    scaffoldBackgroundColor: MyColors.gray_01,
    appBarTheme: AppBarTheme(
        color: MyColors.gray_01,
        toolbarHeight: 48,
        titleSpacing: 24,
        foregroundColor: Colors.black));
