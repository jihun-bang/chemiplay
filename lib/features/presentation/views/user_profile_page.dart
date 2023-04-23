import 'package:cached_network_image/cached_network_image.dart';
import 'package:chemiplay/features/data/models/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/user_viewmodel.dart';

class UserProfilePage extends StatefulWidget {
  final UserProfileModel userProfile;

  const UserProfilePage({
    super.key,
    required this.userProfile,
  });

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(builder: (_, viewModel, ___) {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            _buildGames,
            _buildHead,
          ],
        ),
      );
    });
  }

  Widget get _buildGames {
    return SliverAppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
        pinned: true,
        floating: false,
        snap: false,
        expandedHeight: MediaQuery.of(context).size.height / 2,
        flexibleSpace: CachedNetworkImage(
          imageUrl: widget.userProfile.imageUrls.first,
          fit: BoxFit.cover,
        ));
  }

  Widget get _buildHead {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: 1000,
          child: Text(
            widget.userProfile.name,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              height: 25.0 / 18.0,
              letterSpacing: -0.02,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
