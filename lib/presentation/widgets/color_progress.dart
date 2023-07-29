import 'package:flutter/material.dart';

class ColorProgress extends StatefulWidget {
  final Widget child;
  final bool isRun;
  final int duration;
  const ColorProgress({
    super.key,
    required this.child,
    required this.isRun,
    required this.duration,
  });

  @override
  State<ColorProgress> createState() => _ColorProgressState();
}

class _ColorProgressState extends State<ColorProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.duration = Duration(milliseconds: widget.duration);
    if (widget.isRun == true) {
      _controller.forward();
    } else {
      _controller.reset();
    }
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _) {
        return ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: const <Color>[Color(0xFFFF8066), Color(0xFFCED3D9)],
              stops: [_controller.value, _controller.value + 0.01],
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcIn,
          child: widget.child,
        );
      },
    );
  }
}

class ColorOverlayPainter extends CustomPainter {
  ColorOverlayPainter({required this.color, required this.percentage});

  final Color color;
  final double percentage;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final gradient = LinearGradient(
      colors: [Colors.transparent, color],
      stops: [0.0, percentage],
    );
    final paint = Paint()..shader = gradient.createShader(rect);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(ColorOverlayPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.percentage != percentage;
  }
}

class ProgressBarPainter extends CustomPainter {
  ProgressBarPainter({required this.percentage});

  final double percentage;

  @override
  void paint(Canvas canvas, Size size) {
    final completedBar =
        Rect.fromLTWH(0, 0, size.width * percentage, size.height);
    final emptyBar = Rect.fromLTWH(
        size.width * percentage, 0, size.width * (1 - percentage), size.height);
    final paintCompleted = Paint()..color = Colors.blue;
    final paintEmpty = Paint()..color = Colors.grey;

    canvas.drawRect(completedBar, paintCompleted);
    canvas.drawRect(emptyBar, paintEmpty);
  }

  @override
  bool shouldRepaint(ProgressBarPainter oldDelegate) {
    return oldDelegate.percentage != percentage;
  }
}
