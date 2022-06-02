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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAr97g-0ukHbGgSP3gW6b4qGhDNeVp51lE',
    appId: '1:87216574308:web:c6c3f89ad9ddd4ceb6f471',
    messagingSenderId: '87216574308',
    projectId: 'pandarosh-91270',
    authDomain: 'pandarosh-91270.firebaseapp.com',
    storageBucket: 'pandarosh-91270.appspot.com',
    measurementId: 'G-RYHV395NM5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3zgJz8SN9DZJyXk3pFE2UCklK9TGgGiI',
    appId: '1:87216574308:android:71e72665c2c54584b6f471',
    messagingSenderId: '87216574308',
    projectId: 'pandarosh-91270',
    storageBucket: 'pandarosh-91270.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxrw8MoYV4knOiWllZVo4DJWdnVxCJbUU',
    appId: '1:87216574308:ios:86d1ea893b20dee5b6f471',
    messagingSenderId: '87216574308',
    projectId: 'pandarosh-91270',
    storageBucket: 'pandarosh-91270.appspot.com',
    iosClientId: '87216574308-k7jsbk9t3q1qi3d7jsht00n7ico4ub0o.apps.googleusercontent.com',
    iosBundleId: 'com.pandarosh.pandarosh',
  );
}
