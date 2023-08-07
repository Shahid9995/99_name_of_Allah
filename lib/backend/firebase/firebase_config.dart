import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBmpmwGk8JLYlRP1S6N5_wbEkPTgN9Lk0g",
            authDomain: "thenames-dc778.firebaseapp.com",
            projectId: "thenames-dc778",
            storageBucket: "thenames-dc778.appspot.com",
            messagingSenderId: "254625177098",
            appId: "1:254625177098:web:c57e135d3217a5015849f3",
            measurementId: "G-S3PC4LFZSR"));
  } else {
    await Firebase.initializeApp();
  }
}
