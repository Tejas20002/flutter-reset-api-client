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
///
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
    apiKey: 'AIzaSyBGmYruDxrdRZNftcvHt8BR3drI53JvVrU',
    appId: '1:413276845463:web:bb93a3d0a97fd44dca80d2',
    messagingSenderId: '413276845463',
    projectId: 'rest-api-client-5926e',
    authDomain: 'rest-api-client-5926e.firebaseapp.com',
    storageBucket: 'rest-api-client-5926e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCwK9oxx6s_ef8-jImVhdVxM1W_JE8B4Ew',
    appId: '1:413276845463:android:75ea009dc5f3f916ca80d2',
    messagingSenderId: '413276845463',
    projectId: 'rest-api-client-5926e',
    storageBucket: 'rest-api-client-5926e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDAUk7tSYK-VkUyvWSicWo9iepeHb9VKmk',
    appId: '1:413276845463:ios:9fbc1a435d6f3d4fca80d2',
    messagingSenderId: '413276845463',
    projectId: 'rest-api-client-5926e',
    storageBucket: 'rest-api-client-5926e.appspot.com',
    iosBundleId: 'com.example.pope',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDAUk7tSYK-VkUyvWSicWo9iepeHb9VKmk',
    appId: '1:413276845463:ios:9fbc1a435d6f3d4fca80d2',
    messagingSenderId: '413276845463',
    projectId: 'rest-api-client-5926e',
    storageBucket: 'rest-api-client-5926e.appspot.com',
    iosBundleId: 'com.example.pope',
  );
}
