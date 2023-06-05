import 'package:chemiplay/data/models/user.dart';
import 'package:chemiplay/injection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/user_viewmodel.dart';
import '../../widgets/gigi_app_bar.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
  final _userViewModel = getIt<UserViewModel>();

  UserModel get _user => _userViewModel.user!;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Consumer<UserViewModel>(builder: (_, __, ___) {
      if (!_userViewModel.isAuthenticated) {
        return const Center(child: CircularProgressIndicator());
      }
      return Scaffold(
        appBar:
            const GigiAppBar(title: '내 정보', titleAlign: Alignment.centerLeft),
        body: ListView(
          children: [],
        ),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
