import 'package:flutter/material.dart';

class GigiAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Alignment titleAlign;
  final Widget? titleWidget;
  final Color? backgroundColor;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  const GigiAppBar({
    super.key,
    this.title = '',
    this.titleAlign = Alignment.center,
    this.titleWidget,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.bottom,
  });

  @override
  Size get preferredSize => const Size.fromHeight(48);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
      backgroundColor: backgroundColor,
      title: Align(
        alignment: titleAlign,
        child: titleWidget ??
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
      ),
      elevation: 0,
      centerTitle: true,
      leading: leading,
      actions: actions,
    );
  }
}
