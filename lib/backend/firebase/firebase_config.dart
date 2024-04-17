import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyARXDO3fNR23OujWkzUbTvTco-R50gfiWQ",
            authDomain: "kisan-mitra-qacd8o.firebaseapp.com",
            projectId: "kisan-mitra-qacd8o",
            storageBucket: "kisan-mitra-qacd8o.appspot.com",
            messagingSenderId: "771283154312",
            appId: "1:771283154312:web:268bb79dc9f4554642f63d"));
  } else {
    await Firebase.initializeApp();
  }
}
