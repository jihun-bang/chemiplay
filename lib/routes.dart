import 'package:chemiplay/presentation/views/chat_list_page.dart';
import 'package:chemiplay/presentation/views/chat_page.dart';
import 'package:chemiplay/presentation/views/feed/feed_page.dart';
import 'package:chemiplay/presentation/views/home_page.dart';
import 'package:chemiplay/presentation/views/login_page.dart';
import 'package:chemiplay/presentation/views/mate/mate_page.dart';
import 'package:chemiplay/presentation/views/mate/mate_request_together_page.dart';
import 'package:chemiplay/presentation/views/mate/mate_profile_page.dart';
import 'package:chemiplay/presentation/views/mate/mates_page.dart';
import 'package:chemiplay/presentation/views/my/my_page.dart';
import 'package:chemiplay/presentation/views/my/my_profile_image_page.dart';
import 'package:chemiplay/presentation/views/signup/profile/signup_profile_page.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'data/models/mate.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routes = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (
        BuildContext context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) {
        return HomePage(child: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/',
              name: 'mates',
              builder: (BuildContext context, GoRouterState state) =>
                  const MatesPage(),
              routes: [
                GoRoute(
                  path: 'mate-profile',
                  name: 'mate-profile',
                  builder: (context, state) {
                    return const MateProfileSettingPage();
                  },
                ),
                GoRoute(
                  path: 'mate/:id',
                  name: 'mate',
                  builder: (context, state) {
                    final id = state.pathParameters['id'] ?? 'unknown';
                    return MateProfilePage(
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
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/feed',
              name: 'feed',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: FeedPage()),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
                path: '/chats',
                name: 'chats',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ChatListPage()),
                routes: [
                  GoRoute(
                      path: 'chat/:userId',
                      name: 'chat',
                      builder: (context, state) {
                        final userId =
                            state.pathParameters['userId'] ?? 'unknown';
                        return ChatPage(userId: userId);
                      }),
                ]),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
                path: '/my',
                name: 'my',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: MyPage()),
                routes: [
                  GoRoute(
                      path: 'edit',
                      name: 'myEdit',
                      builder: (context, state) => const MyProfileImagePage()),
                ]),
          ],
        ),
      ],
    ),
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
          path: 'profile',
          name: 'signup/profile',
          pageBuilder: (context, state) {
            return const MaterialPage(child: SignupProfilePage());
          },
        ),
      ],
    ),
    GoRoute(
      path: '/together',
      name: 'together',
      pageBuilder: (context, state) {
        return const MaterialPage(child: MateRequestTogetherPage());
      },
    ),
  ],
);
