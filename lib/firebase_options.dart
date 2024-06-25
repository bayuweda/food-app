import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
        return linux;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyArLh0nX3JB4idCY12oX0BH4UfVf6d8XoY',
    appId: '1:662339213862:web:3b39f2305acd1de46da4e7',
    messagingSenderId: '662339213862',
    projectId: 'food-app-1c58d',
    authDomain: 'food-app-1c58d.firebaseapp.com',
    storageBucket: 'food-app-1c58d.appspot.com',
    measurementId: 'G-H5CZDSLWN9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAi3awfiHo3Dn_vyji_yxI2ss1CQnpYYMk',
    appId: '1:662339213862:android:0c36e175364ae3eb6da4e7',
    messagingSenderId: '662339213862',
    projectId: 'food-app-1c58d',
    storageBucket: 'food-app-1c58d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'YOUR_IOS_API_KEY',
    appId: 'YOUR_IOS_APP_ID',
    messagingSenderId: 'YOUR_IOS_MESSAGING_SENDER_ID',
    projectId: 'food-app-1c58d',
    storageBucket: 'food-app-1c58d.appspot.com',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'YOUR_MACOS_API_KEY',
    appId: 'YOUR_MACOS_APP_ID',
    messagingSenderId: 'YOUR_MACOS_MESSAGING_SENDER_ID',
    projectId: 'food-app-1c58d',
    storageBucket: 'food-app-1c58d.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'YOUR_WINDOWS_API_KEY',
    appId: 'YOUR_WINDOWS_APP_ID',
    messagingSenderId: 'YOUR_WINDOWS_MESSAGING_SENDER_ID',
    projectId: 'food-app-1c58d',
    storageBucket: 'food-app-1c58d.appspot.com',
  );

  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: 'YOUR_LINUX_API_KEY',
    appId: 'YOUR_LINUX_APP_ID',
    messagingSenderId: 'YOUR_LINUX_MESSAGING_SENDER_ID',
    projectId: 'food-app-1c58d',
    storageBucket: 'food-app-1c58d.appspot.com',
  );
}
