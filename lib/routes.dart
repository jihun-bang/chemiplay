import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/presentation/views/home_page.dart';
import 'features/presentation/views/login_page.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      pageBuilder: (context, state) {
        return const MaterialPage(child: HomePage());
      },
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      pageBuilder: (context, state) {
        return const MaterialPage(child: LoginPage());
      },
    ),
  ],
);
