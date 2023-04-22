import 'package:chemiplay/features/presentation/viewmodels/login_viewmodel.dart';
import 'package:chemiplay/injection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<LoginViewModel>(),
      child: Consumer<LoginViewModel>(builder: (_, __, ___) {
        return _LoginView();
      }),
    );
  }
}

class _LoginView extends StatelessWidget {
  final _viewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: _viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : _buildLoginForm(context),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: ElevatedButton(
          onPressed: () async {
            await _viewModel.loginWithGoogle();
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
