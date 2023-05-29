import 'package:flutter/material.dart';

class GigiElevatedButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final double height;
  final double? width;
  final VoidCallback? onPressed;
  final Color backgroundColor;

  const GigiElevatedButton({
    super.key,
    required this.text,
    this.textStyle = const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF2B2B2B)),
    this.height = 54,
    this.width,
    this.onPressed,
    this.backgroundColor = const Color(0xFFFF8066),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          fixedSize: Size(width ?? double.infinity, height),
          backgroundColor: backgroundColor,
          padding: EdgeInsets.zero),
      onPressed: onPressed,
      child: Center(child: Text(text, style: textStyle)),
    );
  }
}
