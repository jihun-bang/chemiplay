import 'package:chemiplay/utils/colors.dart';
import 'package:chemiplay/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyListButton extends StatelessWidget {
  final String label;
  final String icon;
  final VoidCallback? onPressed;
  final BorderRadius? borderRadius;
  final bool hasLine;

  const MyListButton({
    super.key,
    required this.label,
    required this.icon,
    this.onPressed,
    this.borderRadius,
    this.hasLine = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: hasLine
          ? const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
              color: Color(0xFFE4E6EB),
            )))
          : null,
      height: 62,
      child: Material(
        color: Colors.white,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.only(left: 21, right: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(right: 8),
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset('assets/icons/icon_$icon.svg'),
                    ),
                    Container(
                      height: 24,
                      alignment: Alignment.center,
                      child: Text(
                        label,
                        style: MyTextStyle.body1Med(),
                      ),
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
