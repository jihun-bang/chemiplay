import 'package:flutter/material.dart';

class GiGiElevatedButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final double height;
  final double? width;
  final VoidCallback? onPressed;
  final Color backgroundColor;

  const GiGiElevatedButton({
    super.key,
    required this.text,
    this.textStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
