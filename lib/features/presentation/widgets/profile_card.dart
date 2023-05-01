import 'package:cached_network_image/cached_network_image.dart';
import 'package:chemiplay/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileCard extends StatelessWidget {
  final bool isOnline;
  final String name;
  final double rating;
  final String game;
  final String description;
  final int cost;
  final String imageUrl;
  final VoidCallback? onTap;

  const ProfileCard({
    super.key,
    required this.isOnline,
    required this.name,
    required this.rating,
    required this.game,
    required this.description,
    required this.cost,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.2),
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: _buildStatus,
                ),
                Positioned.fill(
                  bottom: 12,
                  left: 12,
                  right: 12,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [_buildTitle, _buildDescription, _buildCost],
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onTap,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _buildTitle {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            letterSpacing: -0.2,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.star_rate_rounded,
              color: MyColors.pri_05,
              size: 16,
            ),
            Text(
              rating.toStringAsFixed(1),
              style: TextStyle(
                color: MyColors.pri_05,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget get _buildStatus {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.only(right: 3),
          decoration: BoxDecoration(
              color: isOnline ? const Color(0xFF55F29D) : Colors.redAccent,
              shape: BoxShape.circle,
              border: Border.all(color: MyColors.gray_01)),
        ),
        Text(
          isOnline ? '온라인' : '오프라인',
          style: const TextStyle(
              fontWeight: FontWeight.w600, color: Colors.white, fontSize: 8),
        )
      ],
    );
  }

  Widget get _buildDescription {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 16,
                height: 16,
                margin: const EdgeInsets.only(right: 4),
                child: CircleAvatar(
                  backgroundColor: MyColors.gray_04,
                ),
              ),
              Text(
                game,
                style: TextStyle(
                  color: MyColors.gray_04,
                  fontSize: 10,
                ),
              )
            ],
          ),
          Text(
            description,
            style: TextStyle(color: MyColors.gray_05, fontSize: 12),
          )
        ],
      ),
    );
  }

  Widget get _buildCost {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SvgPicture.asset('assets/icons/icon_coin.svg'),
        RichText(
            text: TextSpan(
                text: cost.toString(),
                style: const TextStyle(
                  color: Color(0xFF53DCF0),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                children: [
              TextSpan(
                  text: '/판',
                  style: TextStyle(
                      color: MyColors.gray_04,
                      fontSize: 14,
                      fontWeight: FontWeight.normal))
            ]))
      ],
    );
  }
}
