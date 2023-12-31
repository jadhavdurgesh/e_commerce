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
    apiKey: 'AIzaSyBtnPgyWhygiCzuoXYJbtJd6TxX4sDf6E8',
    appId: '1:468753528041:web:9281141f064644f259ec78',
    messagingSenderId: '468753528041',
    projectId: 'ecommerce-cf246',
    authDomain: 'ecommerce-cf246.firebaseapp.com',
    storageBucket: 'ecommerce-cf246.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCDyb4kK5BnAQcAhHxLs7tnrk_HoQigOhc',
    appId: '1:468753528041:android:667ea43fdf96eb6159ec78',
    messagingSenderId: '468753528041',
    projectId: 'ecommerce-cf246',
    storageBucket: 'ecommerce-cf246.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-7SkrdxCy9wWt6rVYo_6iFoILYn1lx8w',
    appId: '1:468753528041:ios:fd953a904ee8a3a659ec78',
    messagingSenderId: '468753528041',
    projectId: 'ecommerce-cf246',
    storageBucket: 'ecommerce-cf246.appspot.com',
    iosClientId: '468753528041-6al92g0kvuhboj260hcvvfr3ej0cg7s5.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA-7SkrdxCy9wWt6rVYo_6iFoILYn1lx8w',
    appId: '1:468753528041:ios:e991e338aa60463659ec78',
    messagingSenderId: '468753528041',
    projectId: 'ecommerce-cf246',
    storageBucket: 'ecommerce-cf246.appspot.com',
    iosClientId: '468753528041-cc4t0u615c2vdnsre4guqv2tb3lc2c6s.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerce.RunnerTests',
  );
}
