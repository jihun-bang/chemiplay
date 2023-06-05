import 'package:chemiplay/utils/colors.dart';
import 'package:chemiplay/utils/text_style.dart';
import 'package:flutter/material.dart';

class UserInteractionWidget extends StatelessWidget {
  final int following;
  final int follower;
  final int visitor;

  const UserInteractionWidget({
    super.key,
    required this.following,
    required this.follower,
    required this.visitor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 280),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildInteraction('팔로잉', following),
            _buildInteraction('팔로워', follower),
            _buildInteraction('방문자', visitor),
          ],
        ),
      ),
    );
  }

  Widget _buildInteraction(String label, int number) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child:
              Text(label, style: MyTextStyle.body2Med(color: MyColors.gray_05)),
        ),
        Text(number.toString(), style: MyTextStyle.sub1Semi())
      ],
    );
  }
}
