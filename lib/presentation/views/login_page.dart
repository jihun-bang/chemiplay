import 'package:chemiplay/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../../domain/usecases/login_usecase.dart';
import '../../utils/constants.dart';
import '../dialog/toast.dart';
import '../viewmodels/login_viewmodel.dart';
import '../widgets/sign_in_button/stub.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginViewModel _viewModel;
  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: Constants.googleClientId,
  );

  @override
  void initState() {
    super.initState();

    googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      if (account != null) {
        final result =
            await getIt<LoginUseCase>().loginWithGoogle(account: account);
        if (!mounted) return;
        if (result != null) {
          if (context.canPop()) {
            showToast(context: context, message: '환영합니다!');
            context.pop();
          } else {
            context.goNamed('home');
          }
        } else {
          showToast(context: context, message: '로그인을 실패했어요.');
        }
      }
    });
    googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<LoginViewModel>(),
      child: Consumer<LoginViewModel>(builder: (_, viewModel, ___) {
        _viewModel = viewModel;
        return Scaffold(
          body: Column(
            children: [
              Expanded(flex: 3, child: _buildLogo),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      _buildDivider,
                      buildSignInButton(onPressed: () async {
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
                      }),
                    ],
                  )),
            ],
          ),
        );
      }),
    );
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
}
