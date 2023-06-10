import 'package:chemiplay/data/models/user.dart';
import 'package:chemiplay/injection.dart';
import 'package:chemiplay/presentation/views/my/widgets/my_coin.dart';
import 'package:chemiplay/presentation/views/my/widgets/my_list_button.dart';
import 'package:chemiplay/presentation/views/my/widgets/my_user_interaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/user_viewmodel.dart';
import '../../widgets/gigi_app_bar.dart';
import 'widgets/my_profile.dart';

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
          children: [
            MyProfile(user: _user),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: MyUserInteractionWidget(
                  following: 990, follower: 990, visitor: 990),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: MyCoin(
                onPressed: () {},
              ),
            ),
            MyListButton(label: '게임 메이트 되기', onPressed: () {}),
            MyListButton(label: '지난 플레이', onPressed: () {}),
            MyListButton(label: '고객센터', onPressed: () {}),
            MyListButton(label: '설정', onPressed: () {}),
          ],
        ),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
