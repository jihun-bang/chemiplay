import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';

class GiGiElevatedButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final double height;
  final VoidCallback? onPressed;

  const GiGiElevatedButton({
    super.key,
    required this.text,
    this.textStyle = const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: -0.02),
    this.height = 54,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: Size.fromHeight(height), backgroundColor: MyColors.pri_05),
      onPressed: onPressed,
      child: Center(
          child: Text(
        text,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: -0.02),
      )),
    );
  }
}
