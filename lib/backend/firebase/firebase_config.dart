import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCJBAkQfIGhNqo5r2-L_a9Bc70RoLJUYw8",
            authDomain: "artiverse-i9waf2.firebaseapp.com",
            projectId: "artiverse-i9waf2",
            storageBucket: "artiverse-i9waf2.firebasestorage.app",
            messagingSenderId: "242514954720",
            appId: "1:242514954720:web:78a08156cf5e26fd8f0385"));
  } else {
    await Firebase.initializeApp();
  }
}
