import 'package:chemiplay/features/domain/usecases/login_usecase.dart';
import 'package:chemiplay/features/presentation/viewmodels/login_viewmodel.dart';
import 'package:chemiplay/features/presentation/widgets/sign_in_button/google_sign_in_button.dart';
import 'package:chemiplay/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _viewModel = getIt<LoginViewModel>();
  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: Constants.googleClientId,
  );

  @override
  void initState() {
    super.initState();

    googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      if (account != null) {
        final result = await getIt<LoginUseCase>().signInFirebase(account);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted && result) {
            context.goNamed('home');
          }
        });
      }
    });
    googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(builder: (_, __, ___) {
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
    });
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
