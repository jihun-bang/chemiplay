import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class GameCost extends StatelessWidget {
  final String cost;
  final String unit;
  final TextStyle costStyle;
  final TextStyle unitStyle;

  const GameCost({
    super.key,
    required this.unit,
    required this.cost,
    this.unitStyle = const TextStyle(
      color: Color(0xFF53DCF0),
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    this.costStyle = const TextStyle(
      color: Color(0xFFCED3D9),
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SvgPicture.asset('assets/icons/icon_coin.svg'),
        RichText(
            text: TextSpan(text: cost, style: costStyle, children: [
          TextSpan(
            text: '/$unit',
            style: unitStyle,
          )
        ]))
      ],
    );
  }
}
