import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:iitappdevelopment/Services/global_variable.dart' as global;

class AndroidActivity {
  static const platform = const MethodChannel("flutter_android_channel");
  FirebaseUser _user;
  String _mail;

  getAlarmActivity() async {
    _user = global.user;
    _mail = _user.email;

    try {
      await platform.invokeMethod('startAlarmActivity'); // pass _mail data
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
}
