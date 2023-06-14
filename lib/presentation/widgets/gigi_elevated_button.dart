import 'package:flutter/material.dart';

class GigiElevatedButton extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final double height;
  final double? width;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color shadowColor;
  final bool disabled;

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
    this.disabled = false,
  });

  @override
  State<GigiElevatedButton> createState() => _GigiElevatedButtonState();
}

class _GigiElevatedButtonState extends State<GigiElevatedButton> {
  bool isDown = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: widget.height,
      child: SizedBox(
        height: widget.height - (isDown ? 4 : 0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: widget.backgroundColor,
            boxShadow: !isDown
                ? [
                    BoxShadow(
                      color: widget.shadowColor,
                      offset: const Offset(4.0, 4.0),
                      blurRadius: 0,
                    ),
                  ]
                : null,
            border: Border.all(
              color: widget.shadowColor,
              width: 1.4, // Width: 1.4px
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12.0),
            onTap: widget.disabled != true ? widget.onPressed : () {},
            onTapDown: (_) {
              if (widget.disabled != true) {
                setState(() {
                  isDown = true;
                });
              }
            },
            onTapUp: (_) {
              if (widget.disabled != true) {
                setState(() {
                  isDown = false;
                });
              }
            },
            child: Center(
              child: Text(
                widget.text,
                style: widget.textStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
