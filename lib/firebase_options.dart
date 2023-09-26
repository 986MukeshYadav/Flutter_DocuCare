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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCaasgJ_uc5MySncruX4VyH0qiEnL23VIo',
    appId: '1:206717758403:android:da4c17c9d7d0fbe3e7ab76',
    messagingSenderId: '206717758403',
    projectId: 'docucare-92bd8',
    storageBucket: 'docucare-92bd8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBrSrtFznPUkgTWhswrDHUmrkrYKVqBjGY',
    appId: '1:206717758403:ios:d81c9a83b38ce508e7ab76',
    messagingSenderId: '206717758403',
    projectId: 'docucare-92bd8',
    storageBucket: 'docucare-92bd8.appspot.com',
    androidClientId: '206717758403-t1apud6jcu5khmaefloe8oro68d6gdbi.apps.googleusercontent.com',
    iosClientId: '206717758403-it0ma0ncdk8ia7g28vn2hljoo186o2do.apps.googleusercontent.com',
    iosBundleId: 'com.example.firstApp',
  );
}