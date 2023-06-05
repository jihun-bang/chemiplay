import 'package:cached_network_image/cached_network_image.dart';
import 'package:chemiplay/data/models/user.dart';
import 'package:chemiplay/utils/colors.dart';
import 'package:chemiplay/utils/text_style.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  final UserModel user;
  final VoidCallback onTap;

  const MyProfile({
    super.key,
    required this.user,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildProfileImage,
        _buildNameEmail,
      ],
    );
  }

  Widget get _buildProfileImage {
    return Container(
      width: 80,
      height: 80,
      margin: const EdgeInsets.only(right: 16, left: 24, top: 16),
      child: CircleAvatar(
        radius: 50,
        backgroundImage: CachedNetworkImageProvider(user.profileImageUrl ?? ''),
      ),
    );
  }

  Widget get _buildNameEmail {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(user.name, style: MyTextStyle.h3Semi()),
                  ),
                  Text(user.email,
                      style: MyTextStyle.body2Reg(color: MyColors.gray_07)),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(right: 24),
                width: 9.12,
                height: 16,
                child: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: MyColors.gray_06,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
