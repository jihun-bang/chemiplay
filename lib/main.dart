import 'package:chemiplay/presentation/viewmodels/chat_viewmodel.dart';
import 'package:chemiplay/presentation/viewmodels/user_viewmodel.dart';
import 'package:chemiplay/presentation/viewmodels/verify_phone_number_viewmodel.dart';
import 'package:chemiplay/routes.dart';
import 'package:chemiplay/utils/thema.dart';
import 'package:chemiplay/utils/web_plugins/web_plugin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
  pathUrlStrategy();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserViewModel>(
          create: (_) => getIt(),
        ),
        ChangeNotifierProvider<ChatViewModel>(
          create: (_) => getIt(),
        ),
        ChangeNotifierProvider<VerifyPhoneNumberViewModel>(
          create: (_) => getIt(),
        ),
      ],
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: 640),
          child: MaterialApp.router(
            title: '캐미플레이',
            theme: lightTheme,
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
        ),
      ),
    );
  }
}
