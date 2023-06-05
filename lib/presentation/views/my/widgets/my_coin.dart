import 'package:chemiplay/presentation/widgets/game_cost.dart';
import 'package:chemiplay/utils/text_style.dart';
import 'package:flutter/material.dart';

class MyCoin extends StatelessWidget {
  final VoidCallback? onPressed;

  const MyCoin({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF4D4D4D),
              offset: Offset(2, 2),
              blurRadius: 0,
            ),
          ],
          border: Border.all(
            color: const Color(0xFF4D4D4D),
            width: 0.8, // Width: 1.4px
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12.0),
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 16.85),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '내코인',
                    style: MyTextStyle.sub2Semi(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GameCost(
                        unit: '',
                        cost: ' 5000',
                        costStyle: MyTextStyle.sub1Semi(),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        width: 24,
                        height: 24,
                        child: const Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
