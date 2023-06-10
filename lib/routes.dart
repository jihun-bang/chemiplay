import 'package:chemiplay/presentation/views/chat_list_page.dart';
import 'package:chemiplay/presentation/views/chat_page.dart';
import 'package:chemiplay/presentation/views/home_page.dart';
import 'package:chemiplay/presentation/views/login_page.dart';
import 'package:chemiplay/presentation/views/mate/mate_page.dart';
import 'package:chemiplay/presentation/views/signup/profile/signup_profile_gender_page.dart';
import 'package:chemiplay/presentation/views/signup/profile/signup_profile_image_page.dart';
import 'package:chemiplay/presentation/views/signup/profile/signup_profile_nickname_page.dart';
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
            path: 'mate/:id',
            name: 'mate',
            pageBuilder: (context, state) {
              final id = state.params['id'] ?? 'unknown';
              return MaterialPage(
                child: MateProfilePage(
                  id: id,
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
    GoRoute(
        path: '/signup',
        name: 'signup',
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginPage());
        },
        routes: [
          GoRoute(
            path: 'gender',
            name: 'signup/gender',
            pageBuilder: (context, state) {
              return const MaterialPage(child: SignupProfileGenderPage());
            },
          ),
          GoRoute(
            path: 'nickname',
            name: 'signup/nickname',
            pageBuilder: (context, state) {
              return const MaterialPage(child: SignupProfileNicknamePage());
            },
          ),
          GoRoute(
            path: 'profile-image',
            name: 'signup/profile-image',
            pageBuilder: (context, state) {
              return const MaterialPage(child: SignupProfileImagePage());
            },
          ),
        ]),
  ],
);
