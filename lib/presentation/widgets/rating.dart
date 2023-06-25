import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';

class Rating extends StatelessWidget {
  final double rating;
  final int? count;

  const Rating({
    super.key,
    required this.rating,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/icons/icon_star.svg'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Text(
            rating.toStringAsFixed(1),
            style: const TextStyle(
                fontSize: 18, height: 21.48 / 18, fontWeight: FontWeight.w600),
          ),
        ),
        if (count != null)
          Text(
            '(${count! > 99 ? '99+' : count})',
            style: TextStyle(color: MyColors.gray_06, height: 16.71 / 14),
          )
      ],
    );
  }
}
