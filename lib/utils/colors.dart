import 'package:flutter/material.dart';

class MyColors {
  MyColors._privateConstructor();

  static final MyColors _instance = MyColors._privateConstructor();

  factory MyColors() {
    return _instance;
  }

  static Color aqua = const Color(0xFF2ED0E5);

  static Color pri_05 = const Color(0xFFFF8066);
  static Color pri_06 = const Color(0xFFF76D52);

  static Color vio_06 = const Color(0xFFA58BF0);

  static Color gray_01 = const Color(0xFFF5F7FA);
  static Color gray_02 = const Color(0xFFEDEFF2);
  static Color gray_03 = const Color(0xFFE4E6EB);
  static Color gray_04 = const Color(0xFFCED3D9);
  static Color gray_05 = const Color(0xFFAEB4BD);
  static Color gray_06 = const Color(0xFF8A9099);
  static Color gray_07 = const Color(0xFF6E737A);

  static Color black_02 = const Color(0xFF2B2B2B);
  static Color black_03 = const Color(0xFF4D4D4D);
}
