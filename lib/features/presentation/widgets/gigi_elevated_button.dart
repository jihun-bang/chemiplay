import 'package:flutter/material.dart';

class GigiElevatedButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final double height;
  final double? width;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color shadowColor;

  const GigiElevatedButton({
    super.key,
    required this.text,
    this.textStyle = const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF2B2B2B)),
    this.height = 54,
    this.width,
    this.onPressed,
    this.backgroundColor = const Color(0xFFFF8066),
    this.shadowColor = const Color(0xFF4D4D4D),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              offset: const Offset(4.0, 4.0),
              blurRadius: 0,
            ),
          ],
          border: Border.all(
            color: shadowColor,
            width: 1.4, // Width: 1.4px
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            child: Center(
              child: Text(
                text,
                style: textStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
