import 'package:flutter/material.dart';

class MyTextStyle {
  MyTextStyle._privateConstructor();

  static final MyTextStyle _instance = MyTextStyle._privateConstructor();

  factory MyTextStyle() {
    return _instance;
  }

  static TextStyle h3Semi({Color? color}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 22,
      );

  static TextStyle sub1Semi({Color? color}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );

  static TextStyle sub2Semi({Color? color}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      );

  static TextStyle body2Reg({Color? color}) => TextStyle(
        color: color,
        fontSize: 14,
      );

  static TextStyle body2Med({Color? color}) =>
      TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w500);
}
