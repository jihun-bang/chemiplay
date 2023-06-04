import 'package:chemiplay/presentation/views/chat_list_page.dart';
import 'package:chemiplay/presentation/views/chat_page.dart';
import 'package:chemiplay/presentation/views/home_page.dart';
import 'package:chemiplay/presentation/views/login_page.dart';
import 'package:chemiplay/presentation/views/user_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'data/models/mate.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        name: 'home',
        pageBuilder: (context, state) {
          return const MaterialPage(child: HomePage());
        },
        routes: [
          GoRoute(
            path: 'user/:id',
            name: 'user',
            pageBuilder: (context, state) {
              final id = state.params['id'] ?? 'unknown';
              return MaterialPage(
                child: UserProfilePage(
                  userProfile: MateModel(
                    name: id,
                    rating: 4.6,
                    game: '리그오브레전드',
                    description: '브론즈 소농민 대기중',
                    cost: 1100,
                    imageUrls: [
                      'https://firebasestorage.googleapis.com/v0/b/gigi-chemiplay.appspot.com/o/profile_image%2Fuser_2.jpg?alt=media&token=2d827a1a-b61a-4902-a163-b35a9d545fe5'
                    ],
                    isOnline: true,
                  ),
                ),
              );
            },
          ),
          GoRoute(
            path: 'chats',
            name: 'chats',
            pageBuilder: (context, state) {
              return const MaterialPage(child: ChatListPage());
            },
          ),
          GoRoute(
            path: 'chat/:userId',
            name: 'chat',
            pageBuilder: (context, state) {
              final userId = state.params['userId'] ?? 'unknown';
              return MaterialPage(child: ChatPage(userId: userId));
            },
          )
        ]),
    GoRoute(
      path: '/login',
      name: 'login',
      pageBuilder: (context, state) {
        return const MaterialPage(child: LoginPage());
      },
    ),
  ],
);
