import 'package:flutter/material.dart';

class AppBarLeadIcon extends StatelessWidget {
  final BuildContext context;
  final VoidCallback? onPressed;
  const AppBarLeadIcon({
    super.key,
    required this.context,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.pop(context);
        }
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Color(0xff2b2b2b),
      ),
    );
  }
}
