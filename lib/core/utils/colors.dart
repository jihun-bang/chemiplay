import 'package:flutter/material.dart';

class MyColors {
  MyColors._privateConstructor();

  static final MyColors _instance = MyColors._privateConstructor();

  factory MyColors() {
    return _instance;
  }

  static Color aqua = const Color(0xFF2ED0E5);

  static Color pri_05 = const Color(0xFFFF8066);

  static Color gray_01 = const Color(0xFFF5F7FA);
  static Color gray_02 = const Color(0xFFEDEFF2);
  static Color gray_03 = const Color(0xFFE4E6EB);
  static Color gray_04 = const Color(0xFFCED3D9);
  static Color gray_05 = const Color(0xFFAEB4BD);
  static Color gray_06 = const Color(0xFF8A9099);
}
