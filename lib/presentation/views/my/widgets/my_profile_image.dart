import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyProfileImage extends StatefulWidget {
  final String? profileImageUrl;
  final VoidCallback? onTap;
  final double width;
  final double height;

  const MyProfileImage({
    super.key,
    this.profileImageUrl,
    this.onTap,
    this.width = 80,
    this.height = 80,
  });

  @override
  State<MyProfileImage> createState() => _MyProfileImageState();
}

class _MyProfileImageState extends State<MyProfileImage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _buildProfileImage;
  }

  Widget get _buildProfileImage {
    return GestureDetector(
      onTap: _isLoading
          ? null
          : () async {
              if (widget.onTap == null) return;
              setState(() {
                _isLoading = true;
              });
              await Future.sync(widget.onTap!);
              setState(() {
                _isLoading = false;
              });
            },
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Stack(
          children: [
            Positioned.fill(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                backgroundImage: widget.profileImageUrl != null
                    ? CachedNetworkImageProvider(widget.profileImageUrl!)
                    : null,
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : widget.profileImageUrl == null
                        ? Icon(
                            Icons.person,
                            color: const Color(0xffFFE7E1),
                            size: widget.width - 8,
                          )
                        : null,
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: SvgPicture.asset('assets/icons/icon_edit_circle.svg'))
          ],
        ),
      ),
    );
  }
}
