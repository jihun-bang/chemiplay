import 'package:flutter/material.dart';

class GigiElevatedSquareButton extends StatefulWidget {
  final Widget widget;
  final double height;
  final double? width;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color shadowColor;
  final bool disabled;

  const GigiElevatedSquareButton({
    super.key,
    required this.widget,
    this.height = 54,
    this.width,
    this.onPressed,
    this.backgroundColor = Colors.white,
    this.shadowColor = const Color(0xFF4D4D4D),
    this.disabled = false,
  });

  @override
  State<GigiElevatedSquareButton> createState() =>
      _GigiElevatedSquareButtonState();
}

class _GigiElevatedSquareButtonState extends State<GigiElevatedSquareButton> {
  bool isDown = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: widget.height,
      width: widget.width,
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
              child: Center(
                child: widget.widget,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
