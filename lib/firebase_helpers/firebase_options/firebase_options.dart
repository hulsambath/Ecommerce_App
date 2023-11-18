import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '1:39639201172:ios:b907a6e657c96b7ca68b81',
        apiKey: 'AIzaSyBlqvJ_7vlOlctGUIMGxgjggkMfCfHzgbs',
        projectId: 'ecommerce-57d2c',
        messagingSenderId: '39639201172',
        iosBundleId: 'com.example.ecommercd',
      );
    } else {
      // Android
      return const FirebaseOptions(
        appId: '1:39639201172:android:0d2b0e97c0cd9810a68b81',
        apiKey: 'AIzaSyDhyODSPxSbVADRxnCrKP5gNR622ehqdDI',
        projectId: 'ecommerce-57d2c',
        messagingSenderId: '39639201172	',
      );
    }
  }
}
