import 'package:flutter/material.dart';

class SignupProfileTitle extends StatelessWidget {
  final String title;
  final String? subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  const SignupProfileTitle({
    super.key,
    required this.title,
    this.subTitle,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        const SizedBox(
          height: 64,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
        subTitle != null
            ? Text(
                subTitle!,
                style: const TextStyle(
                  fontSize: 16,
                ),
              )
            : const SizedBox(
                height: 23,
              ),
      ],
    );
  }
}
