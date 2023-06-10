import 'package:flutter/material.dart';

class AppBarLeadIcon extends StatelessWidget {
  final BuildContext context;
  const AppBarLeadIcon({
    super.key,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Color(0xff2b2b2b),
      ),
    );
  }
}
