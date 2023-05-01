import 'package:chemiplay/features/presentation/viewmodels/chat_room_viewmodel.dart';
import 'package:chemiplay/features/presentation/viewmodels/login_viewmodel.dart';
import 'package:chemiplay/features/presentation/viewmodels/user_viewmodel.dart';
import 'package:chemiplay/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'injection.dart';

Future<void> main() async {
  /// Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// Injection
  setupDependencies();

  /// URL # 제거
  usePathUrlStrategy();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserViewModel>(
          create: (_) => getIt<UserViewModel>(),
        ),
        ChangeNotifierProvider<LoginViewModel>(
          create: (_) => getIt<LoginViewModel>(),
        ),
        ChangeNotifierProvider<ChatRoomViewModel>(
          create: (_) => getIt<ChatRoomViewModel>(),
        ),
      ],
      child: MaterialApp.router(
        title: '캐미플레이',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        routeInformationProvider: routes.routeInformationProvider,
        routeInformationParser: routes.routeInformationParser,
        routerDelegate: routes.routerDelegate,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
