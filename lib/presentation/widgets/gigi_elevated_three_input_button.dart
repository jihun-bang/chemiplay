import 'package:flutter/material.dart';

class GigiElevatedThreeInputButton extends StatelessWidget {
  final Widget widget;
  final Widget prefixWidget;
  final Widget suffixWidget;
  final double height;
  final double? width;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color shadowColor;

  const GigiElevatedThreeInputButton({
    super.key,
    required this.widget,
    required this.prefixWidget,
    required this.suffixWidget,
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
            borderRadius: BorderRadius.circular(12.0),
            onTap: onPressed,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: prefixWidget,
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: widget,
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: suffixWidget,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
