import 'package:cached_network_image/cached_network_image.dart';
import 'package:chemiplay/presentation/viewmodels/mate_audio_viewmodel.dart';
import 'package:chemiplay/presentation/widgets/color_progress.dart';
import 'package:chemiplay/presentation/widgets/rating.dart';
import 'package:chemiplay/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/colors.dart';

class ProfileCard extends StatefulWidget {
  final String id;
  final bool isOnline;
  final String name;
  final double rating;
  final String game;
  final String description;
  final int cost;
  final String imageUrl;
  final VoidCallback? onTap;
  final MateAudioViewModel mateAudioViewModel;

  const ProfileCard({
    super.key,
    required this.id,
    required this.isOnline,
    required this.name,
    required this.rating,
    required this.game,
    required this.description,
    required this.cost,
    required this.imageUrl,
    required this.mateAudioViewModel,
    this.onTap,
  });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  bool _isPlay = false;

  @override
  Widget build(BuildContext context) {
    _isPlay = widget.mateAudioViewModel.userId == widget.id;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      height: 156,
      child: InkWell(
        borderRadius: BorderRadius.circular(14.5),
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              _buildImage,
              Expanded(child: _buildDescription),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _buildImage {
    return Container(
      alignment: Alignment.center,
      width: 132,
      height: 132,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.5),
              child: CachedNetworkImage(
                  imageUrl: widget.imageUrl, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            left: 8,
            top: 8,
            child: _buildStatus,
          ),
          Positioned(
            left: 4,
            bottom: 4,
            child: Container(
              width: 62,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.783),
                color: Colors.white.withOpacity(0.9),
              ),
              child: InkWell(
                onTap: () async {
                  if (!_isPlay) {
                    await widget.mateAudioViewModel.play(
                      url: '/assets/audio/test.mp3',
                      userId: widget.id,
                    );
                  } else {
                    await widget.mateAudioViewModel.pause();
                  }
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/icon_${_isPlay ? 'pause' : 'play'}.svg',
                      width: 33,
                      height: 33,
                    ),
                    ColorProgress(
                      isRun: _isPlay,
                      duration: widget.mateAudioViewModel.duration,
                      child: SvgPicture.asset(
                        'assets/icons/icon_audiowave_on.svg',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget get _buildStatus {
    return Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: widget.isOnline ? const Color(0xFF55F29D) : Colors.redAccent,
          border: Border.all(
            color: MyColors.gray_01,
            width: 1.6,
          ),
          borderRadius: const BorderRadius.all(Radius.elliptical(16, 16)),
        ));
  }

  Widget get _buildDescription {
    return Container(
      alignment: Alignment.centerLeft,
      height: 118,
      margin: const EdgeInsets.only(left: 14, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: MyTextStyle.sub2Semi(color: MyColors.black_02),
                ),
                const SizedBox(height: 5),
                Rating(
                  rating: widget.rating,
                  count: 100,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Text(
                    widget.description,
                    style: TextStyle(color: MyColors.gray_07, fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          _buildCost
        ],
      ),
    );
  }

  Widget get _buildCost {
    return Row(
      children: [
        SvgPicture.asset('assets/icons/icon_coin.svg'),
        Row(
          children: [
            Text(
              widget.cost.toString(),
              style: MyTextStyle.h3Semi(color: MyColors.black_02),
            ),
            const SizedBox(width: 2),
            Text(
              '/판',
              style: MyTextStyle.sub2Reg(
                  color: MyColors.gray_06, letterSpacing: -0.36),
            )
          ],
        ),
      ],
    );
  }
}
