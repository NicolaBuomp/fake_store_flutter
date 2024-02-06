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
    apiKey: 'AIzaSyBZKNlhfiLewmqC71bZYLt7di04lqIs_kI',
    appId: '1:1006924795685:web:f6b8354b77cf66e97914cc',
    messagingSenderId: '1006924795685',
    projectId: 'ecommerceapp-76e64',
    authDomain: 'ecommerceapp-76e64.firebaseapp.com',
    storageBucket: 'ecommerceapp-76e64.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBE9A_WjGgHpi7qDxT67dWu7td5P16DBUI',
    appId: '1:1006924795685:android:985bf53bf08e0df17914cc',
    messagingSenderId: '1006924795685',
    projectId: 'ecommerceapp-76e64',
    storageBucket: 'ecommerceapp-76e64.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAYMMy0evhpPrw0XFAZ1AM0cvVUZvKjDC4',
    appId: '1:1006924795685:ios:45fbc0b2c37f488d7914cc',
    messagingSenderId: '1006924795685',
    projectId: 'ecommerceapp-76e64',
    storageBucket: 'ecommerceapp-76e64.appspot.com',
    iosBundleId: 'com.example.fakeStoreFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAYMMy0evhpPrw0XFAZ1AM0cvVUZvKjDC4',
    appId: '1:1006924795685:ios:5b4502deea153b6f7914cc',
    messagingSenderId: '1006924795685',
    projectId: 'ecommerceapp-76e64',
    storageBucket: 'ecommerceapp-76e64.appspot.com',
    iosBundleId: 'com.example.fakeStoreFlutter.RunnerTests',
  );
}