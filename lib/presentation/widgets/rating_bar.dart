import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class GigiRatingBar extends StatelessWidget {
  final double initialRating;
  final ValueChanged<double>? onRatingUpdate;
  final double itemSize;
  final bool ignoreGestures;

  const GigiRatingBar({
    super.key,
    this.initialRating = 5,
    this.onRatingUpdate,
    this.itemSize = 20,
    this.ignoreGestures = true,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating,
      minRating: 1,
      allowHalfRating: true,
      unratedColor: Colors.white,
      itemCount: 5,
      itemBuilder: (_, __) => SvgPicture.asset('assets/icons/icon_star.svg'),
      itemSize: itemSize,
      ignoreGestures: ignoreGestures,
      updateOnDrag: true,
      glow: false,
      onRatingUpdate: onRatingUpdate ?? (_) {},
    );
  }
}
