// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBtmvSrDwc-LfU-Z3MLDJkxGeFuSJ75L0Q',
    appId: '1:1069088958634:web:a41a39c512abba9008c8d3',
    messagingSenderId: '1069088958634',
    projectId: 'rssentosa-82d6d',
    authDomain: 'rssentosa-82d6d.firebaseapp.com',
    storageBucket: 'rssentosa-82d6d.firebasestorage.app',
    measurementId: 'G-ZLCPQCR433',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAUmOYkxZGBTVfB-gc8a76IFMGlfj8z43I',
    appId: '1:1069088958634:android:0300b58c9d5a21a408c8d3',
    messagingSenderId: '1069088958634',
    projectId: 'rssentosa-82d6d',
    storageBucket: 'rssentosa-82d6d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDYQOn4Agz2g4LLAKul4CfH72in3PpBTNA',
    appId: '1:1069088958634:ios:1313e69386c5ad0e08c8d3',
    messagingSenderId: '1069088958634',
    projectId: 'rssentosa-82d6d',
    storageBucket: 'rssentosa-82d6d.firebasestorage.app',
    iosClientId: '1069088958634-pg02euioc56ug3fa3j98e9d6s9n13d4d.apps.googleusercontent.com',
    iosBundleId: 'com.example.medheal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDYQOn4Agz2g4LLAKul4CfH72in3PpBTNA',
    appId: '1:1069088958634:ios:1313e69386c5ad0e08c8d3',
    messagingSenderId: '1069088958634',
    projectId: 'rssentosa-82d6d',
    storageBucket: 'rssentosa-82d6d.firebasestorage.app',
    iosClientId: '1069088958634-pg02euioc56ug3fa3j98e9d6s9n13d4d.apps.googleusercontent.com',
    iosBundleId: 'com.example.medheal',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBtmvSrDwc-LfU-Z3MLDJkxGeFuSJ75L0Q',
    appId: '1:1069088958634:web:42f954304d74854808c8d3',
    messagingSenderId: '1069088958634',
    projectId: 'rssentosa-82d6d',
    authDomain: 'rssentosa-82d6d.firebaseapp.com',
    storageBucket: 'rssentosa-82d6d.firebasestorage.app',
    measurementId: 'G-Z90FW65F1K',
  );

}