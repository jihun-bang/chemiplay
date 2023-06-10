import 'package:chemiplay/utils/colors.dart';
import 'package:chemiplay/utils/text_style.dart';
import 'package:flutter/material.dart';

class MyListButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const MyListButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 62,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.only(left: 21, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 12),
                      width: 16,
                      height: 16,
                      color: Colors.black,
                    ),
                    Text(
                      label,
                      style: MyTextStyle.body1Med(),
                    ),
                  ],
                ),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: MyColors.gray_06,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
