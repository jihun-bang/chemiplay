import 'package:cached_network_image/cached_network_image.dart';
import 'package:chemiplay/data/models/user.dart';
import 'package:chemiplay/utils/colors.dart';
import 'package:chemiplay/utils/text_style.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  final UserModel user;

  const MyProfile({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(user.name, style: MyTextStyle.h3Semi()),
        ),
        Text(user.email, style: MyTextStyle.body2Reg(color: MyColors.gray_07)),
      ],
    );
  }
}
