import 'package:chemiplay/data/models/user.dart';
import 'package:chemiplay/utils/colors.dart';
import 'package:chemiplay/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'my_profile_image.dart';

class MyProfile extends StatelessWidget {
  final UserModel user;

  const MyProfile({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            context.pushNamed('profileEdit');
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildProfileImage(context),
              _buildNameEmail,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 16, left: 24),
        child: MyProfileImage(
          profileImageUrl: user.profileImageUrl,
          width: 80,
          height: 80,
          onTap: () {
            context.pushNamed('profileEdit');
          },
        ));
  }

  Widget get _buildNameEmail {
    return Expanded(
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
    );
  }
}
