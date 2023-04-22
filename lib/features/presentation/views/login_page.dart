import 'package:chemiplay/features/presentation/viewmodels/login_viewmodel.dart';
import 'package:chemiplay/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _viewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => getIt<LoginViewModel>(),
        child: Consumer<LoginViewModel>(builder: (_, __, ___) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(child: _buildLogo),
                _buildDivider,
                _buildLoginWithGoogle,
              ],
            ),
          );
        }));
  }

  Widget get _buildLogo => Container(
        width: 352,
        height: 247,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SvgPicture.asset('assets/images/img_logo.svg'),
      );

  Widget get _buildDivider => Container(
        height: 18,
        margin: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Expanded(
                child: Divider(
              color: Colors.grey,
            )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '간편 로그인',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                )),
            Expanded(
                child: Divider(
              color: Colors.grey,
            )),
          ],
        ),
      );

  Widget get _buildLoginWithGoogle {
    return Padding(
      padding: const EdgeInsets.only(bottom: 86),
      child: IconButton(
        onPressed: () async {
          final result = await _viewModel.loginWithGoogle();
          if (result) {
            if (mounted) {
              context.goNamed('home');
            } else {
              /// TODO
            }
          } else {
            /// TODO 로그인 실패 시 처리
          }
        },
        icon: Image.asset('assets/icons/icon_google.png'),
        iconSize: 50,
      ),
    );
  }
}
