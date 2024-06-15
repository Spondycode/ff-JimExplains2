import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDlqA_SMDx3UKUSBLDr99qmxa--mesyyRQ",
            authDomain: "jimexplainsproject.firebaseapp.com",
            projectId: "jimexplainsproject",
            storageBucket: "jimexplainsproject.appspot.com",
            messagingSenderId: "929863063820",
            appId: "1:929863063820:web:cd4361aa2c9175914b9129",
            measurementId: "G-P4BYRCWR1X"));
  } else {
    await Firebase.initializeApp();
  }
}
