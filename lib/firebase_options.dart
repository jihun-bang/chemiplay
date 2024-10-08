// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBvoQXMSwu4GC07IuuCEsCj6HDkORQVQmc',
    appId: '1:364552677945:web:2d52996531a8fc924dbbe8',
    messagingSenderId: '364552677945',
    projectId: 'gigi-chemiplay',
    authDomain: 'gigi-chemiplay.firebaseapp.com',
    storageBucket: 'gigi-chemiplay.appspot.com',
    measurementId: 'G-6PC6K8CTQZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAkZWN5NPchokHTB9ikJPtPef_jQLZTewc',
    appId: '1:364552677945:android:585ced86856749f44dbbe8',
    messagingSenderId: '364552677945',
    projectId: 'gigi-chemiplay',
    storageBucket: 'gigi-chemiplay.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB6lyFT6Z_S9LKuZT_fFZbhPh2RFZ63FA8',
    appId: '1:364552677945:ios:c04226db42e816b84dbbe8',
    messagingSenderId: '364552677945',
    projectId: 'gigi-chemiplay',
    storageBucket: 'gigi-chemiplay.appspot.com',
    iosClientId: '364552677945-38pikp7u4qd26dfbpe973c8fjtnm66gj.apps.googleusercontent.com',
    iosBundleId: 'com.chemiplay.chemiplay',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB6lyFT6Z_S9LKuZT_fFZbhPh2RFZ63FA8',
    appId: '1:364552677945:ios:c04226db42e816b84dbbe8',
    messagingSenderId: '364552677945',
    projectId: 'gigi-chemiplay',
    storageBucket: 'gigi-chemiplay.appspot.com',
    iosClientId: '364552677945-38pikp7u4qd26dfbpe973c8fjtnm66gj.apps.googleusercontent.com',
    iosBundleId: 'com.chemiplay.chemiplay',
  );
}
